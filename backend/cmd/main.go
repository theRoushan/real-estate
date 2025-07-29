package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"

	"property-swipe-api/internal/config"
	"property-swipe-api/internal/handlers"
	"property-swipe-api/internal/middleware"
	"property-swipe-api/internal/services"
	"property-swipe-api/pkg/firebase"
)

func main() {
	// Load configuration
	cfg := config.Load()

	// Initialize Firebase
	firebaseApp, err := firebase.Initialize(cfg.Firebase.ServiceAccountPath)
	if err != nil {
		log.Fatalf("Failed to initialize Firebase: %v", err)
	}

	// Initialize services
	authService := services.NewAuthService(firebaseApp)
	propertyService := services.NewPropertyService(firebaseApp)
	matchService := services.NewMatchService(firebaseApp)
	userService := services.NewUserService(firebaseApp)

	// Initialize handlers
	authHandler := handlers.NewAuthHandler(authService)
	propertyHandler := handlers.NewPropertyHandler(propertyService)
	matchHandler := handlers.NewMatchHandler(matchService)
	userHandler := handlers.NewUserHandler(userService)

	// Setup Gin router
	if cfg.Environment == "production" {
		gin.SetMode(gin.ReleaseMode)
	}
	
	router := gin.New()
	
	// Middleware
	router.Use(gin.Logger())
	router.Use(gin.Recovery())
	
	// CORS configuration
	corsConfig := cors.DefaultConfig()
	corsConfig.AllowOrigins = cfg.CORS.AllowedOrigins
	corsConfig.AllowMethods = []string{"GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"}
	corsConfig.AllowHeaders = []string{"Origin", "Content-Type", "Authorization"}
	corsConfig.AllowCredentials = true
	router.Use(cors.New(corsConfig))

	// Health check endpoint
	router.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"status":  "healthy",
			"service": "PropertySwipe API",
			"version": "1.0.0",
			"time":    time.Now().Format(time.RFC3339),
		})
	})

	// API routes
	v1 := router.Group("/api/v1")
	{
		// Authentication routes
		auth := v1.Group("/auth")
		{
			auth.POST("/verify-token", authHandler.VerifyToken)
			auth.POST("/refresh", authHandler.RefreshToken)
		}

		// Protected routes (require authentication)
		protected := v1.Group("/")
		protected.Use(middleware.AuthMiddleware(authService))
		{
			// User routes
			users := protected.Group("/users")
			{
				users.POST("/profile", userHandler.CreateProfile)
				users.GET("/profile", userHandler.GetProfile)
				users.PUT("/profile", userHandler.UpdateProfile)
				users.DELETE("/profile", userHandler.DeleteProfile)
			}

			// Property routes
			properties := protected.Group("/properties")
			{
				properties.GET("/feed", propertyHandler.GetPropertyFeed)
				properties.POST("/swipe", propertyHandler.RecordSwipe)
				properties.GET("/:id", propertyHandler.GetProperty)
				properties.POST("/", propertyHandler.CreateProperty)
				properties.PUT("/:id", propertyHandler.UpdateProperty)
				properties.DELETE("/:id", propertyHandler.DeleteProperty)
			}

			// Match routes
			matches := protected.Group("/matches")
			{
				matches.GET("/", matchHandler.GetMatches)
				matches.POST("/:id/interest", matchHandler.ExpressInterest)
				matches.DELETE("/:id", matchHandler.DeleteMatch)
			}

			// Chat routes (basic implementation)
			chat := protected.Group("/chat")
			{
				chat.GET("/:roomId/messages", matchHandler.GetChatMessages)
				chat.POST("/:roomId/send", matchHandler.SendMessage)
			}
		}
	}

	// Create HTTP server
	server := &http.Server{
		Addr:    ":" + cfg.Server.Port,
		Handler: router,
	}

	// Start server in a goroutine
	go func() {
		log.Printf("PropertySwipe API server starting on port %s", cfg.Server.Port)
		if err := server.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("Failed to start server: %v", err)
		}
	}()

	// Wait for interrupt signal to gracefully shutdown the server
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	log.Println("Shutting down server...")

	// Graceful shutdown with timeout
	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
	defer cancel()

	if err := server.Shutdown(ctx); err != nil {
		log.Fatalf("Server forced to shutdown: %v", err)
	}

	log.Println("Server exited")
}