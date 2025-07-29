/// API configuration constants for PropertySwipe backend
class ApiConfig {
  // Base URLs for different environments
  static const String _baseUrlDev = 'http://localhost:8080';
  static const String _baseUrlProd = 'https://your-production-api.com';
  
  // Current environment (change this for production)
  static const bool _isProduction = false;
  
  /// Base URL for API requests
  static String get baseUrl => _isProduction ? _baseUrlProd : _baseUrlDev;
  
  /// API version prefix
  static const String apiVersion = '/api/v1';
  
  /// Complete base URL with version
  static String get apiBaseUrl => '$baseUrl$apiVersion';
  
  // API Endpoints
  static const String healthEndpoint = '/health';
  
  // Auth endpoints
  static const String authVerifyToken = '/auth/verify-token';
  static const String authRefreshToken = '/auth/refresh';
  
  // User endpoints
  static const String userProfile = '/users/profile';
  
  // Property endpoints
  static const String propertyFeed = '/properties/feed';
  static const String propertySwipe = '/properties/swipe';
  static const String properties = '/properties';
  
  // Match endpoints
  static const String matches = '/matches';
  static const String matchInterest = '/matches/{id}/interest';
  
  // Chat endpoints
  static const String chatMessages = '/chat/{roomId}/messages';
  static const String chatSend = '/chat/{roomId}/send';
  
  // HTTP timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}