package services

import (
	"property-swipe-api/pkg/firebase"
)

// PropertyService handles property-related operations
type PropertyService struct {
	firebaseApp *firebase.App
}

// NewPropertyService creates a new property service
func NewPropertyService(firebaseApp *firebase.App) *PropertyService {
	return &PropertyService{
		firebaseApp: firebaseApp,
	}
}

// TODO: Implement property service methods
// - GetPropertyFeed
// - CreateProperty
// - UpdateProperty
// - DeleteProperty
// - RecordSwipe
// - GetProperty