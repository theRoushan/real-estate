package services

import (
	"property-swipe-api/pkg/firebase"
)

// UserService handles user-related operations
type UserService struct {
	firebaseApp *firebase.App
}

// NewUserService creates a new user service
func NewUserService(firebaseApp *firebase.App) *UserService {
	return &UserService{
		firebaseApp: firebaseApp,
	}
}

// TODO: Implement user service methods
// - CreateProfile
// - GetProfile
// - UpdateProfile
// - DeleteProfile