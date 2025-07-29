import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_config.dart';
import '../exceptions/api_exception.dart';

/// HTTP client for API requests with authentication and error handling
class ApiClient {
  late final Dio _dio;
  final FirebaseAuth _firebaseAuth;
  
  ApiClient({FirebaseAuth? firebaseAuth}) 
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance {
    _initializeDio();
  }
  
  void _initializeDio() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.apiBaseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      sendTimeout: ApiConfig.sendTimeout,
      headers: ApiConfig.defaultHeaders,
    ));
    
    // Add interceptors
    _dio.interceptors.add(_AuthInterceptor(_firebaseAuth));
    _dio.interceptors.add(_ErrorInterceptor());
    _dio.interceptors.add(_LoggingInterceptor());
  }
  
  /// GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }
  
  /// POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }
  
  /// PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }
  
  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }
  
  /// Upload file
  Future<Response<T>> upload<T>(
    String path,
    List<File> files, {
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final formData = FormData();
      
      // Add files
      for (int i = 0; i < files.length; i++) {
        formData.files.add(MapEntry(
          'files',
          await MultipartFile.fromFile(
            files[i].path,
            filename: 'image_$i.jpg',
          ),
        ));
      }
      
      // Add other data
      if (data != null) {
        for (final entry in data.entries) {
          formData.fields.add(MapEntry(entry.key, entry.value.toString()));
        }
      }
      
      return await _dio.post<T>(
        path,
        data: formData,
        onSendProgress: onSendProgress,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }
  
  ApiException _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiException.timeout();
        case DioExceptionType.badResponse:
          return ApiException.server(
            error.response?.statusCode ?? 500,
            error.response?.data?['message'] ?? 'Server error',
          );
        case DioExceptionType.cancel:
          return ApiException.cancelled();
        case DioExceptionType.connectionError:
          return ApiException.network();
        default:
          return ApiException.unknown(error.message ?? 'Unknown error');
      }
    }
    return ApiException.unknown(error.toString());
  }
}

/// Authentication interceptor to add Firebase JWT token to requests
class _AuthInterceptor extends Interceptor {
  final FirebaseAuth _firebaseAuth;
  
  _AuthInterceptor(this._firebaseAuth);
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Skip auth for certain endpoints
    if (_shouldSkipAuth(options.path)) {
      return handler.next(options);
    }
    
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        final token = await user.getIdToken();
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      // Continue without token if auth fails
      print('Failed to get auth token: $e');
    }
    
    handler.next(options);
  }
  
  bool _shouldSkipAuth(String path) {
    final skipPaths = [
      ApiConfig.healthEndpoint,
      ApiConfig.authVerifyToken,
    ];
    return skipPaths.any((skipPath) => path.contains(skipPath));
  }
}

/// Error interceptor for handling HTTP errors
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log error details
    print('API Error: ${err.requestOptions.method} ${err.requestOptions.path}');
    print('Status Code: ${err.response?.statusCode}');
    print('Error Data: ${err.response?.data}');
    
    handler.next(err);
  }
}

/// Logging interceptor for debugging
class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('🚀 ${options.method} ${options.uri}');
    if (options.data != null) {
      print('📤 ${jsonEncode(options.data)}');
    }
    handler.next(options);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('✅ ${response.statusCode} ${response.requestOptions.uri}');
    print('📥 ${jsonEncode(response.data)}');
    handler.next(response);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('❌ ${err.response?.statusCode} ${err.requestOptions.uri}');
    print('💥 ${err.message}');
    handler.next(err);
  }
}

/// Provider for ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});