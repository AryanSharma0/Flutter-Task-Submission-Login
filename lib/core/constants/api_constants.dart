class ApiConstants {
  // Base URL for the API
  static const String baseUrl = 'https://api.escuelajs.co';

  // Authentication endpoints
  static const String loginEndpoint = '/api/v1/auth/login';
  static const String refreshTokenEndpoint = '/api/v1/auth/refresh-token';
  static const String profileEndpoint = '/api/v1/auth/profile';

  // Request timeout duration
  static const Duration requestTimeout = Duration(seconds: 30);

  // Storage keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';

  // API response status codes
  static const int successCode = 200;
  static const int createdCode = 201;
  static const int badRequestCode = 400;
  static const int unauthorizedCode = 401;
  static const int notFoundCode = 404;
  static const int serverErrorCode = 500;
}
