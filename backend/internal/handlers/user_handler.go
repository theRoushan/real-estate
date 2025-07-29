package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"property-swipe-api/internal/services"
)

// UserHandler handles user endpoints
type UserHandler struct {
	userService *services.UserService
}

// NewUserHandler creates a new user handler
func NewUserHandler(userService *services.UserService) *UserHandler {
	return &UserHandler{
		userService: userService,
	}
}

// CreateProfile creates a user profile
func (h *UserHandler) CreateProfile(c *gin.Context) {
	c.JSON(http.StatusCreated, gin.H{
		"message": "Create profile endpoint - to be implemented",
	})
}

// GetProfile gets user profile
func (h *UserHandler) GetProfile(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "Get profile endpoint - to be implemented",
	})
}

// UpdateProfile updates user profile
func (h *UserHandler) UpdateProfile(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "Update profile endpoint - to be implemented",
	})
}

// DeleteProfile deletes user profile
func (h *UserHandler) DeleteProfile(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "Delete profile endpoint - to be implemented",
	})
}