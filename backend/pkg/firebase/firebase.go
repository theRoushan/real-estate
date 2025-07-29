package firebase

import (
	"context"
	"log"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"cloud.google.com/go/firestore"
	"cloud.google.com/go/storage"
	"google.golang.org/api/option"
)

// App wraps Firebase app and provides easy access to services
type App struct {
	App       *firebase.App
	Auth      *auth.Client
	Firestore *firestore.Client
	Storage   *storage.Client
}

// Initialize initializes Firebase with service account credentials
func Initialize(serviceAccountPath string) (*App, error) {
	ctx := context.Background()

	var app *firebase.App
	var err error

	if serviceAccountPath != "" {
		// Initialize with service account file
		opt := option.WithCredentialsFile(serviceAccountPath)
		app, err = firebase.NewApp(ctx, nil, opt)
	} else {
		// Initialize with default credentials (for Cloud Run, etc.)
		app, err = firebase.NewApp(ctx, nil)
	}

	if err != nil {
		return nil, err
	}

	// Initialize Auth client
	authClient, err := app.Auth(ctx)
	if err != nil {
		return nil, err
	}

	// Initialize Firestore client
	firestoreClient, err := app.Firestore(ctx)
	if err != nil {
		return nil, err
	}

	// Initialize Storage client - skip for development if not needed
	var storageClient *storage.Client
	// Storage client initialization can be added later when needed

	log.Println("Firebase initialized successfully")

	return &App{
		App:       app,
		Auth:      authClient,
		Firestore: firestoreClient,
		Storage:   storageClient,
	}, nil
}

// Close closes all Firebase clients
func (a *App) Close() error {
	if a.Firestore != nil {
		return a.Firestore.Close()
	}
	if a.Storage != nil {
		return a.Storage.Close()
	}
	return nil
}

// Collections defines Firestore collection names
type Collections struct {
	Users         string
	Properties    string
	Matches       string
	Conversations string
	SwipeHistory  string
}

// GetCollections returns the standard collection names
func GetCollections() Collections {
	return Collections{
		Users:         "users",
		Properties:    "properties",
		Matches:       "matches",
		Conversations: "conversations",
		SwipeHistory:  "swipeHistory",
	}
}