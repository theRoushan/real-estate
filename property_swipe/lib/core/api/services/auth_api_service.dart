import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_client.dart';
import '../api_config.dart';
import '../dtos/api_response.dart';

/// Service for authentication-related API calls
class AuthApiService {
  final ApiClient _apiClient;
  final FirebaseAuth _firebaseAuth;
  
  AuthApiService(this._apiClient, this._firebaseAuth);
  
  /// Verify Firebase token with backend
  Future<bool> verifyToken(String token) async {
    try {
      final response = await _apiClient.post(
        ApiConfig.authVerifyToken,
        data: {'token': token},
      );
      
      return response.data['valid'] ?? false;
    } catch (e) {
      return false;
    }
  }
  
  /// Refresh authentication token
  Future<String?> refreshToken() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) return null;
      
      final token = await user.getIdToken(true); // Force refresh
      
      final response = await _apiClient.post(
        ApiConfig.authRefreshToken,
        data: {'token': token},
      );
      
      return response.data['token'];
    } catch (e) {
      return null;
    }
  }
  
  /// Get current Firebase user
  User? get currentUser => _firebaseAuth.currentUser;
  
  /// Get current user's ID token
  Future<String?> getCurrentUserToken() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    
    try {
      return await user.getIdToken();
    } catch (e) {
      return null;
    }
  }
  
  /// Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  
  /// Create user with email and password
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  
  /// Sign in with phone number
  Future<void> signInWithPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
  
  /// Verify phone number with SMS code
  Future<UserCredential> verifyPhoneNumberWithCode({
    required String verificationId,
    required String smsCode,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    
    return await _firebaseAuth.signInWithCredential(credential);
  }
  
  /// Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  
  /// Check backend health
  Future<HealthResponse> checkHealth() async {
    final response = await _apiClient.get(ApiConfig.healthEndpoint);
    return HealthResponse.fromJson(response.data);
  }
  
  /// Listen to auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}

/// Provider for AuthApiService
final authApiServiceProvider = Provider<AuthApiService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthApiService(apiClient, FirebaseAuth.instance);
});