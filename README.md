# 🏠 PropertySwipe

> *Swipe Right for Your Dream Home*

India's first Tinder-style real estate matching app for instant property discovery. Built with Flutter and Go, powered by Firebase.

[![Flutter](https://img.shields.io/badge/Flutter-3.19.6-blue.svg)](https://flutter.dev/)
[![Go](https://img.shields.io/badge/Go-1.22-00ADD8.svg)](https://golang.org/)
[![Firebase](https://img.shields.io/badge/Firebase-Latest-orange.svg)](https://firebase.google.com/)

## 🚀 Project Overview

PropertySwipe revolutionizes the real estate discovery experience in India by introducing a swipe-based interface similar to dating apps. Users can quickly browse through properties, swipe right to like, left to pass, and up for super likes, making property hunting engaging and efficient.

### 🎯 Key Features

- **Tinder-style Swipe Interface**: Intuitive property discovery with smooth animations
- **Real-time Matching**: Instant connections between property seekers and owners
- **Smart Filtering**: AI-powered property recommendations based on user preferences
- **In-app Messaging**: Direct communication between matched parties
- **Firebase Integration**: Secure authentication and real-time data synchronization
- **Beautiful UI**: Modern Material 3 design with custom themes

## 🏗️ Architecture

```
PropertySwipe/
├── property_swipe/          # Flutter Frontend
│   ├── lib/
│   │   ├── core/           # App constants, themes, utilities
│   │   ├── features/       # Feature-based modules
│   │   ├── models/         # Data models with JSON serialization
│   │   ├── services/       # Business logic services
│   │   └── shared/         # Shared widgets and utilities
│   └── assets/             # Images, fonts, animations
└── backend/                # Go Backend API
    ├── cmd/                # Application entry points
    ├── internal/           # Private application code
    │   ├── handlers/       # HTTP handlers
    │   ├── services/       # Business logic
    │   ├── middleware/     # HTTP middleware
    │   └── config/         # Configuration management
    └── pkg/                # Public packages
```

### Tech Stack

#### Frontend (Flutter)
- **Framework**: Flutter 3.19+
- **Language**: Dart
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **UI Design**: Material 3 with custom themes
- **Key Packages**:
  - `flutter_card_swiper`: Tinder-style card swiping
  - `firebase_auth`: Authentication
  - `cloud_firestore`: Real-time database
  - `cached_network_image`: Optimized image loading

#### Backend (Go)
- **Framework**: Gin Web Framework
- **Language**: Go 1.22+
- **Database**: Firebase Firestore (NoSQL)
- **Authentication**: Firebase Auth with JWT validation
- **Storage**: Firebase Storage for images
- **Architecture**: Clean Architecture principles

#### Infrastructure
- **Database**: Firebase Firestore
- **Authentication**: Firebase Authentication
- **File Storage**: Firebase Storage
- **Hosting**: Firebase Hosting (Frontend), Google Cloud Run (Backend)
- **CI/CD**: GitHub Actions

## 🛠️ Development Setup

### Prerequisites

- Flutter SDK 3.19+ 
- Go 1.22+
- Firebase CLI
- Git
- VS Code or Android Studio (recommended)

### 🏃‍♂️ Quick Start

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/propertyswipe.git
cd propertyswipe
```

2. **Setup Flutter Frontend**
```bash
cd property_swipe
flutter pub get
flutter packages pub run build_runner build
```

3. **Setup Go Backend**
```bash
cd ../backend
go mod tidy
go build ./cmd/main.go
```

4. **Firebase Configuration**
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase project
firebase init
```

5. **Run the applications**

Frontend:
```bash
cd property_swipe
flutter run
```

Backend:
```bash
cd backend
go run cmd/main.go
```

### 🔧 Environment Variables

Create a `.env` file in the backend directory:

```env
ENVIRONMENT=development
PORT=8080
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_SERVICE_ACCOUNT_PATH=path/to/service-account.json
JWT_SECRET_KEY=your-secret-key
CORS_ALLOWED_ORIGINS=http://localhost:3000,http://localhost:8080
```

## 📱 Features Overview

### Core MVP Features ✅
- [x] **Swipe-based Property Discovery**: Tinder-style card interface
- [x] **User Authentication**: Firebase phone OTP verification
- [x] **Property Cards**: Beautiful property display with images and details
- [x] **Responsive Design**: Works on all screen sizes
- [x] **State Management**: Riverpod for efficient state handling

### In Development 🚧
- [ ] **User Profiles**: Complete profile management system
- [ ] **Matching Algorithm**: Smart property-user matching
- [ ] **In-app Messaging**: Real-time chat between users
- [ ] **Property Listing**: Interface for property owners
- [ ] **Advanced Filters**: Location, price, amenities filtering

### Future Roadmap 🔮
- [ ] **Map Integration**: Property locations on maps
- [ ] **Virtual Tours**: 360° property viewing
- [ ] **AI Recommendations**: Machine learning-based suggestions
- [ ] **Push Notifications**: Real-time updates
- [ ] **Social Features**: Property sharing and reviews

## 🎨 Design System

### Color Palette
- **Primary**: `#FF6B6B` (Coral Red) - Energetic and approachable
- **Secondary**: `#4ECDC4` (Teal) - Trustworthy and modern  
- **Accent**: `#45B7D1` (Sky Blue) - Professional
- **Background**: `#FFFFFF` (White) - Clean
- **Surface**: `#F8F9FA` (Light Gray) - Subtle

### Typography
- **Font Family**: Inter (Clean, modern, highly readable)
- **Heading**: Inter Bold 24px
- **Subheading**: Inter SemiBold 18px
- **Body**: Inter Regular 16px
- **Button**: Inter SemiBold 16px

### Spacing System
- **Base Unit**: 8px
- **Small**: 8px
- **Medium**: 16px  
- **Large**: 24px
- **Extra Large**: 32px

## 📊 API Documentation

### Authentication Endpoints
```
POST /api/v1/auth/verify-token    # Verify Firebase JWT token
POST /api/v1/auth/refresh         # Refresh authentication token
```

### Property Endpoints
```
GET  /api/v1/properties/feed      # Get personalized property feed
POST /api/v1/properties/swipe     # Record swipe action
GET  /api/v1/properties/{id}      # Get property details
POST /api/v1/properties           # Create new property
```

### User Endpoints
```
POST /api/v1/users/profile        # Create user profile
GET  /api/v1/users/profile        # Get user profile
PUT  /api/v1/users/profile        # Update user profile
```

### Match Endpoints
```
GET  /api/v1/matches              # Get user matches
POST /api/v1/matches/{id}/interest # Express interest
```

## 🧪 Testing

### Flutter Tests
```bash
cd property_swipe
flutter test                      # Run unit tests
flutter test integration_test/    # Run integration tests
```

### Go Tests
```bash
cd backend
go test ./...                     # Run all tests
go test -cover ./...              # Run with coverage
```

### API Testing
Use the provided Postman collection in `/docs/postman/` for API testing.

## 🚀 Deployment

### Development
```bash
# Frontend (Flutter Web)
flutter build web
firebase deploy --only hosting

# Backend (Local)
go run cmd/main.go
```

### Production
```bash
# Frontend
flutter build web --release
firebase deploy --only hosting

# Backend (Google Cloud Run)
docker build -t propertyswipe-api .
gcloud run deploy propertyswipe-api --image propertyswipe-api
```

## 📈 Performance

### Optimization Strategies
- **Image Caching**: Aggressive caching with `cached_network_image`
- **Lazy Loading**: Properties loaded on-demand
- **State Optimization**: Efficient Riverpod state management
- **Bundle Splitting**: Modular architecture for smaller builds

### Metrics Goals
- **App Launch**: < 3 seconds
- **Swipe Response**: < 100ms
- **Image Loading**: < 2 seconds
- **Memory Usage**: < 100MB average

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team** for the amazing framework
- **Firebase** for the backend infrastructure
- **Go Community** for excellent tooling
- **Unsplash** for property images in development

## 📞 Contact & Support

- **Email**: support@propertyswipe.com
- **Website**: https://propertyswipe.com
- **Twitter**: [@PropertySwipe](https://twitter.com/propertyswipe)

---

<div align="center">
  <p>Built with ❤️ in India</p>
  <p><strong>PropertySwipe</strong> - Making Property Discovery Effortless</p>
</div>
