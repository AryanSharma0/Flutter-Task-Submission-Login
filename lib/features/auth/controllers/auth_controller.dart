import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/validators.dart';
import '../services/auth_service.dart';
import '../models/login_request.dart';
import '../../home/views/home_screen.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxString errorMessage = ''.obs;

  final AuthService _authService = AuthService.to;

  @override
  void onInit() {
    super.onInit();
    _checkInitialAuthState();
  }

  /// Check if user is already authenticated on app start
  Future<void> _checkInitialAuthState() async {
    try {
      final isAuthenticated = await _authService.isAuthenticated();
      if (isAuthenticated) {
        Get.offAll(() => const HomeScreen());
      }
    } catch (e) {
      print('Auth check error: $e');
    }
  }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Clear error message when user starts typing
  void clearError() {
    if (errorMessage.value.isNotEmpty) {
      errorMessage.value = '';
    }
  }

  Future<void> login() async {
    clearError();

    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      // Create login request
      final loginRequest = LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      // Attempt login
      final response = await _authService.login(loginRequest);

      // Show success message
      Get.snackbar(
        'Success',
        'Login successful!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // Navigate to home screen
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      // Handle and display error
      errorMessage.value = _getErrorMessage(e.toString());

      Get.snackbar(
        'Login Failed',
        errorMessage.value,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Parse and format error messages for user display
  String _getErrorMessage(String error) {
    if (error.contains('No internet connection')) {
      return 'Please check your internet connection';
    } else if (error.contains('Unauthorized')) {
      return 'Invalid email or password';
    } else if (error.contains('timeout')) {
      return 'Request timeout. Please try again';
    } else {
      return 'Login failed. Please try again';
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await _authService.logout();

      // Clear form data
      emailController.clear();
      passwordController.clear();
      clearError();

      Get.offAllNamed('/login');

      Get.snackbar(
        'Success',
        'Logged out successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Logout failed: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
