import 'package:get/get.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/constants/api_constants.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final ApiService _apiService = ApiService.to;
  final StorageService _storageService = StorageService.to;

  /// Authenticate user with email and password
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _apiService.post(
        endpoint: ApiConstants.loginEndpoint,
        data: request.toJson(),
      );

      final loginResponse = LoginResponse.fromJson(response);

      if (!loginResponse.isValid) {
        throw Exception('Invalid response from server');
      }

      // Store token securely
      await _storageService.storeToken(loginResponse.accessToken);

      return loginResponse;
    } catch (e) {
      // Log error for debugging (in production, use proper logging)
      print('Login error: $e');
      rethrow;
    }
  }

  /// Check if user is currently authenticated
  Future<bool> isAuthenticated() async {
    return await _storageService.isAuthenticated();
  }

  /// Logout user and clear stored data
  Future<void> logout() async {
    try {
      await _storageService.clearStorage();
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }

  /// Get stored authentication token
  Future<String?> getToken() async {
    return await _storageService.getToken();
  }
}
