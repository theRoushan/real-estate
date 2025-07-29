package services

import (
	"context"
	"errors"

	"firebase.google.com/go/v4/auth"
	"property-swipe-api/pkg/firebase"
)

// AuthService handles authentication operations
type AuthService struct {
	firebaseApp *firebase.App
}

// NewAuthService creates a new auth service
func NewAuthService(firebaseApp *firebase.App) *AuthService {
	return &AuthService{
		firebaseApp: firebaseApp,
	}
}

// VerifyTokenRequest represents a token verification request
type VerifyTokenRequest struct {
	Token string `json:"token" binding:"required"`
}

// VerifyTokenResponse represents a token verification response
type VerifyTokenResponse struct {
	Valid  bool              `json:"valid"`
	UserID string            `json:"userId,omitempty"`
	Claims map[string]interface{} `json:"claims,omitempty"`
	Error  string            `json:"error,omitempty"`
}

// VerifyIDToken verifies a Firebase ID token
func (s *AuthService) VerifyIDToken(ctx context.Context, idToken string) (*auth.Token, error) {
	token, err := s.firebaseApp.Auth.VerifyIDToken(ctx, idToken)
	if err != nil {
		return nil, err
	}
	return token, nil
}

// GetUser gets a user by UID
func (s *AuthService) GetUser(ctx context.Context, uid string) (*auth.UserRecord, error) {
	user, err := s.firebaseApp.Auth.GetUser(ctx, uid)
	if err != nil {
		return nil, err
	}
	return user, nil
}

// CreateCustomToken creates a custom token for a user
func (s *AuthService) CreateCustomToken(ctx context.Context, uid string, claims map[string]interface{}) (string, error) {
	token, err := s.firebaseApp.Auth.CustomToken(ctx, uid)
	if err != nil {
		return "", err
	}
	return token, nil
}

// UpdateUser updates user properties
func (s *AuthService) UpdateUser(ctx context.Context, uid string, params *auth.UserToUpdate) (*auth.UserRecord, error) {
	user, err := s.firebaseApp.Auth.UpdateUser(ctx, uid, params)
	if err != nil {
		return nil, err
	}
	return user, nil
}

// DeleteUser deletes a user
func (s *AuthService) DeleteUser(ctx context.Context, uid string) error {
	return s.firebaseApp.Auth.DeleteUser(ctx, uid)
}

// ValidateAuthToken validates an authorization token from request header
func (s *AuthService) ValidateAuthToken(ctx context.Context, authHeader string) (*auth.Token, error) {
	if authHeader == "" {
		return nil, errors.New("authorization header is required")
	}

	// Extract token from "Bearer <token>" format
	if len(authHeader) < 7 || authHeader[:7] != "Bearer " {
		return nil, errors.New("invalid authorization header format")
	}

	token := authHeader[7:]
	return s.VerifyIDToken(ctx, token)
}