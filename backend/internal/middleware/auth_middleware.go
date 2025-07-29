package middleware

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"property-swipe-api/internal/services"
)

// AuthMiddleware creates authentication middleware
func AuthMiddleware(authService *services.AuthService) gin.HandlerFunc {
	return func(c *gin.Context) {
		authHeader := c.GetHeader("Authorization")
		
		token, err := authService.ValidateAuthToken(c.Request.Context(), authHeader)
		if err != nil {
			c.JSON(http.StatusUnauthorized, gin.H{
				"error": "Unauthorized",
				"message": err.Error(),
			})
			c.Abort()
			return
		}

		// Store user information in context
		c.Set("userID", token.UID)
		c.Set("userClaims", token.Claims)
		
		c.Next()
	}
}

// GetUserID extracts user ID from context
func GetUserID(c *gin.Context) (string, bool) {
	userID, exists := c.Get("userID")
	if !exists {
		return "", false
	}
	return userID.(string), true
}

// GetUserClaims extracts user claims from context
func GetUserClaims(c *gin.Context) (map[string]interface{}, bool) {
	claims, exists := c.Get("userClaims")
	if !exists {
		return nil, false
	}
	return claims.(map[string]interface{}), true
}