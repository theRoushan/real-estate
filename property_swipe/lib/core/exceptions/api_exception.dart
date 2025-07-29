/// Custom exception class for API errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final ApiErrorType type;
  
  const ApiException({
    required this.message,
    this.statusCode,
    required this.type,
  });
  
  /// Network connection error
  factory ApiException.network([String? message]) {
    return ApiException(
      message: message ?? 'No internet connection',
      type: ApiErrorType.network,
    );
  }
  
  /// Request timeout error
  factory ApiException.timeout([String? message]) {
    return ApiException(
      message: message ?? 'Request timeout',
      type: ApiErrorType.timeout,
    );
  }
  
  /// Server error (4xx, 5xx)
  factory ApiException.server(int statusCode, [String? message]) {
    return ApiException(
      message: message ?? 'Server error',
      statusCode: statusCode,
      type: ApiErrorType.server,
    );
  }
  
  /// Authentication error (401, 403)
  factory ApiException.auth([String? message]) {
    return ApiException(
      message: message ?? 'Authentication failed',
      statusCode: 401,
      type: ApiErrorType.auth,
    );
  }
  
  /// Request cancelled
  factory ApiException.cancelled([String? message]) {
    return ApiException(
      message: message ?? 'Request cancelled',
      type: ApiErrorType.cancelled,
    );
  }
  
  /// Validation error (400)
  factory ApiException.validation([String? message]) {
    return ApiException(
      message: message ?? 'Validation error',
      statusCode: 400,
      type: ApiErrorType.validation,
    );
  }
  
  /// Not found error (404)
  factory ApiException.notFound([String? message]) {
    return ApiException(
      message: message ?? 'Resource not found',
      statusCode: 404,
      type: ApiErrorType.notFound,
    );
  }
  
  /// Unknown error
  factory ApiException.unknown([String? message]) {
    return ApiException(
      message: message ?? 'An unexpected error occurred',
      type: ApiErrorType.unknown,
    );
  }
  
  /// Get user-friendly error message
  String get userFriendlyMessage {
    switch (type) {
      case ApiErrorType.network:
        return 'Please check your internet connection and try again.';
      case ApiErrorType.timeout:
        return 'The request took too long. Please try again.';
      case ApiErrorType.server:
        if (statusCode == 500) {
          return 'Server is temporarily unavailable. Please try again later.';
        }
        return message;
      case ApiErrorType.auth:
        return 'Please log in again to continue.';
      case ApiErrorType.validation:
        return message;
      case ApiErrorType.notFound:
        return 'The requested resource was not found.';
      case ApiErrorType.cancelled:
        return 'Request was cancelled.';
      case ApiErrorType.unknown:
        return 'Something went wrong. Please try again.';
    }
  }
  
  @override
  String toString() {
    return 'ApiException(type: $type, statusCode: $statusCode, message: $message)';
  }
}

/// Types of API errors
enum ApiErrorType {
  network,
  timeout,
  server,
  auth,
  validation,
  notFound,
  cancelled,
  unknown,
}