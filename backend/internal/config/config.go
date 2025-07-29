package config

import (
	"os"
	"strings"
)

// Config holds all configuration for the PropertySwipe API
type Config struct {
	Environment string
	Server      ServerConfig
	Firebase    FirebaseConfig
	CORS        CORSConfig
	JWT         JWTConfig
}

// ServerConfig holds server-specific configuration
type ServerConfig struct {
	Port string
	Host string
}

// FirebaseConfig holds Firebase-specific configuration
type FirebaseConfig struct {
	ServiceAccountPath string
	ProjectID          string
	DatabaseURL        string
	StorageBucket      string
}

// CORSConfig holds CORS-specific configuration
type CORSConfig struct {
	AllowedOrigins []string
}

// JWTConfig holds JWT-specific configuration
type JWTConfig struct {
	SecretKey string
	ExpiryHours int
}

// Load loads configuration from environment variables with sensible defaults
func Load() *Config {
	return &Config{
		Environment: getEnv("ENVIRONMENT", "development"),
		Server: ServerConfig{
			Port: getEnv("PORT", "8080"),
			Host: getEnv("HOST", "localhost"),
		},
		Firebase: FirebaseConfig{
			ServiceAccountPath: getEnv("FIREBASE_SERVICE_ACCOUNT_PATH", ""),
			ProjectID:          getEnv("FIREBASE_PROJECT_ID", ""),
			DatabaseURL:        getEnv("FIREBASE_DATABASE_URL", ""),
			StorageBucket:      getEnv("FIREBASE_STORAGE_BUCKET", ""),
		},
		CORS: CORSConfig{
			AllowedOrigins: getEnvSlice("CORS_ALLOWED_ORIGINS", []string{
				"http://localhost:3000",
				"http://localhost:8080",
				"https://propertyswipe.com",
			}),
		},
		JWT: JWTConfig{
			SecretKey:   getEnv("JWT_SECRET_KEY", "your-secret-key-change-in-production"),
			ExpiryHours: getEnvInt("JWT_EXPIRY_HOURS", 24),
		},
	}
}

// getEnv gets an environment variable or returns a default value
func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}

// getEnvSlice gets an environment variable as a slice or returns a default slice
func getEnvSlice(key string, defaultValue []string) []string {
	if value := os.Getenv(key); value != "" {
		return strings.Split(value, ",")
	}
	return defaultValue
}

// getEnvInt gets an environment variable as an integer or returns a default value
func getEnvInt(key string, defaultValue int) int {
	if value := os.Getenv(key); value != "" {
		// Simple integer parsing - in production, add proper error handling
		switch value {
		case "1":
			return 1
		case "24":
			return 24
		case "48":
			return 48
		case "72":
			return 72
		default:
			return defaultValue
		}
	}
	return defaultValue
}

// IsDevelopment returns true if running in development mode
func (c *Config) IsDevelopment() bool {
	return c.Environment == "development"
}

// IsProduction returns true if running in production mode
func (c *Config) IsProduction() bool {
	return c.Environment == "production"
}

// GetServerAddress returns the full server address
func (c *Config) GetServerAddress() string {
	return c.Server.Host + ":" + c.Server.Port
}