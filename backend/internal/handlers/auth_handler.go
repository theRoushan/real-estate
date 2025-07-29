package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"property-swipe-api/internal/services"
)

// AuthHandler handles authentication endpoints
type AuthHandler struct {
	authService *services.AuthService
}

// NewAuthHandler creates a new auth handler
func NewAuthHandler(authService *services.AuthService) *AuthHandler {
	return &AuthHandler{
		authService: authService,
	}
}

// VerifyToken verifies a Firebase ID token
func (h *AuthHandler) VerifyToken(c *gin.Context) {
	var req services.VerifyTokenRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid request body",
			"details": err.Error(),
		})
		return
	}

	token, err := h.authService.VerifyIDToken(c.Request.Context(), req.Token)
	if err != nil {
		c.JSON(http.StatusUnauthorized, services.VerifyTokenResponse{
			Valid: false,
			Error: err.Error(),
		})
		return
	}

	c.JSON(http.StatusOK, services.VerifyTokenResponse{
		Valid:  true,
		UserID: token.UID,
		Claims: token.Claims,
	})
}

// RefreshToken refreshes an ID token (placeholder implementation)
func (h *AuthHandler) RefreshToken(c *gin.Context) {
	// In a real implementation, this would handle token refresh logic
	// For now, return a placeholder response
	c.JSON(http.StatusOK, gin.H{
		"message": "Token refresh endpoint - to be implemented",
	})
}