package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"property-swipe-api/internal/services"
)

// MatchHandler handles match endpoints
type MatchHandler struct {
	matchService *services.MatchService
}

// NewMatchHandler creates a new match handler
func NewMatchHandler(matchService *services.MatchService) *MatchHandler {
	return &MatchHandler{
		matchService: matchService,
	}
}

// GetMatches returns user's matches
func (h *MatchHandler) GetMatches(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "Get matches endpoint - to be implemented",
		"matches": []interface{}{},
	})
}

// ExpressInterest expresses interest from property owner
func (h *MatchHandler) ExpressInterest(c *gin.Context) {
	matchID := c.Param("id")
	c.JSON(http.StatusOK, gin.H{
		"message": "Express interest endpoint - to be implemented",
		"matchId": matchID,
	})
}

// DeleteMatch deletes a match
func (h *MatchHandler) DeleteMatch(c *gin.Context) {
	matchID := c.Param("id")
	c.JSON(http.StatusOK, gin.H{
		"message": "Delete match endpoint - to be implemented",
		"matchId": matchID,
	})
}

// GetChatMessages gets chat messages for a room
func (h *MatchHandler) GetChatMessages(c *gin.Context) {
	roomID := c.Param("roomId")
	c.JSON(http.StatusOK, gin.H{
		"message": "Get chat messages endpoint - to be implemented",
		"roomId": roomID,
		"messages": []interface{}{},
	})
}

// SendMessage sends a message to a chat room
func (h *MatchHandler) SendMessage(c *gin.Context) {
	roomID := c.Param("roomId")
	c.JSON(http.StatusCreated, gin.H{
		"message": "Send message endpoint - to be implemented",
		"roomId": roomID,
	})
}