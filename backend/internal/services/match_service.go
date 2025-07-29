package services

import (
	"property-swipe-api/pkg/firebase"
)

// MatchService handles match-related operations
type MatchService struct {
	firebaseApp *firebase.App
}

// NewMatchService creates a new match service
func NewMatchService(firebaseApp *firebase.App) *MatchService {
	return &MatchService{
		firebaseApp: firebaseApp,
	}
}

// TODO: Implement match service methods
// - GetMatches
// - ExpressInterest
// - DeleteMatch
// - GetChatMessages
// - SendMessage