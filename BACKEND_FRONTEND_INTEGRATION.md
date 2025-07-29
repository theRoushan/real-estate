# Backend-Frontend Integration Guide

This guide explains how to connect and run the PropertySwipe backend (Go) with the frontend (Flutter) app.

## 🎯 Integration Overview

The PropertySwipe app now has full backend integration with:
- ✅ **API Client with authentication interceptors**
- ✅ **Property swipe functionality connected to backend**
- ✅ **Error handling and loading states**
- ✅ **Riverpod state management with backend calls**
- ✅ **Real-time property feed from API**
- ✅ **Swipe action recording with match detection**

## 🚀 Quick Start

### 1. Start the Backend API

```bash
# Navigate to backend directory
cd backend

# Run the Go API server
go run cmd/main.go
```

The backend will start on `http://localhost:8080` with endpoints:
- `GET /health` - Health check
- `GET /api/v1/properties/feed` - Get properties for swiping
- `POST /api/v1/properties/swipe` - Record swipe actions
- `POST /api/v1/auth/verify-token` - Verify Firebase tokens

### 2. Start the Flutter App

```bash
# Navigate to Flutter project
cd property_swipe

# Get dependencies
flutter pub get

# Run the app (requires Flutter SDK installed)
flutter run
```

## 📱 How It Works

### Property Loading Flow

1. **App Launch**: SwipeNotifier automatically loads initial properties
2. **API Call**: `PropertyApiService.getPropertyFeed()` fetches 20 properties
3. **State Update**: Properties are loaded into SwipeState
4. **UI Render**: PropertyCard widgets display the properties
5. **Auto-pagination**: More properties load when user gets close to end

### Swipe Action Flow

1. **User Swipes**: Card swiper detects gesture (left/right/up)
2. **Action Recording**: `SwipeNotifier.handleSwipe()` sends data to backend
3. **Backend Processing**: Go API records swipe and checks for matches
4. **Match Detection**: If mutual interest, match is created
5. **UI Feedback**: Snackbar shows action result, moves to next property

### Error Handling

- **Network Errors**: Automatic retry with user-friendly messages
- **Authentication Errors**: Firebase token refresh with fallback
- **Loading States**: Spinner while fetching data
- **Empty States**: Helpful messages when no properties available

## 🔧 Configuration

### Backend Configuration

Edit `backend/internal/config/config.go` or set environment variables:

```env
PORT=8080
ENVIRONMENT=development
FIREBASE_PROJECT_ID=property-swipe-demo
CORS_ALLOWED_ORIGINS=http://localhost:*
```

### Flutter Configuration

Edit `property_swipe/lib/core/api/api_config.dart`:

```dart
class ApiConfig {
  // Change this for production
  static const String _baseUrlDev = 'http://localhost:8080';
  static const String _baseUrlProd = 'https://your-api.com';
}
```

## 🔥 Firebase Setup

### 1. Backend Firebase Config

Place your Firebase service account JSON in `backend/config/`:

```bash
backend/
├── config/
│   └── firebase-service-account.json
```

### 2. Flutter Firebase Config

The app uses demo Firebase config. For production:

1. Add your `google-services.json` (Android) to `android/app/`
2. Add your `GoogleService-Info.plist` (iOS) to `ios/Runner/`
3. Update `lib/firebase_options.dart` with real config

## 📊 API Endpoints Used

### Properties
- `GET /api/v1/properties/feed` - Get swipeable properties
- `POST /api/v1/properties/swipe` - Record swipe action
- `GET /api/v1/properties/{id}` - Get property details

### Authentication
- `POST /api/v1/auth/verify-token` - Verify Firebase JWT
- `POST /api/v1/auth/refresh` - Refresh auth token

### User Management  
- `GET /api/v1/users/profile` - Get user profile
- `POST /api/v1/users/profile` - Create/update profile

## 🎨 UI States

The SwipePage handles multiple states:

1. **Loading**: Shows spinner while fetching properties
2. **Error**: Shows error message with retry button  
3. **Empty**: Shows "no properties" message
4. **Content**: Shows swipeable property cards
5. **Match**: Shows match notification (planned)

## 🧪 Testing the Integration

### 1. Test Health Check

```bash
curl http://localhost:8080/health
```

Expected response:
```json
{
  "status": "healthy",
  "service": "PropertySwipe API",
  "version": "1.0.0"
}
```

### 2. Test Property Feed

```bash
curl "http://localhost:8080/api/v1/properties/feed?page=1&limit=5"
```

### 3. Test in Flutter App

1. Launch app - should show loading spinner then properties
2. Swipe left/right/up - should see snackbar feedback
3. Check backend logs - should see API calls logged
4. Network errors - turn off wifi to test error states

## 🐛 Troubleshooting

### Common Issues

**1. "Failed to load properties"**
- Check if backend is running on port 8080
- Verify API_CONFIG.baseUrl in Flutter
- Check network connectivity

**2. "Authentication failed"**  
- Ensure Firebase is properly configured
- Check if demo config is being used
- Verify JWT token generation

**3. "No properties shown"**
- Check if backend has seed data
- Verify API response format matches DTOs
- Check Riverpod provider initialization

**4. CORS errors in web**
- Add your Flutter web URL to backend CORS config
- Check preflight OPTIONS requests

### Debug Tips

1. **Enable API logging**: Check dio interceptor logs in debug console
2. **Backend logs**: Monitor Go server output for API calls
3. **Network inspector**: Use Flutter DevTools to inspect HTTP requests
4. **Breakpoints**: Set breakpoints in SwipeNotifier methods

## 📈 Performance Optimizations

1. **Image Caching**: Implemented with `cached_network_image`
2. **Lazy Loading**: Properties loaded as needed
3. **Memory Management**: Old properties cleaned up automatically
4. **Network Batching**: Reduced API calls with smart pagination

## 🔮 Next Steps

1. **Real Firebase Setup**: Replace demo config with production
2. **User Authentication**: Implement login/signup flows  
3. **Push Notifications**: Add FCM for match notifications
4. **Image Upload**: Implement property image upload to Firebase Storage
5. **Location Services**: Add GPS-based property filtering
6. **Offline Support**: Cache properties for offline viewing

## 🤝 Development Workflow

1. **Backend Changes**: Restart Go server, test endpoints
2. **Frontend Changes**: Hot reload in Flutter, test UI
3. **API Changes**: Update DTOs and regenerate if needed
4. **Testing**: Use both curl and Flutter app for validation

---

The PropertySwipe app is now fully connected to the backend! The swipe experience loads real data, records user actions, and handles all edge cases gracefully. 🎉