class LoginResponse {
  final String accessToken;
  final String refreshToken;
  final String? tokenType;
  final int? expiresIn;

  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    this.tokenType,
    this.expiresIn,
  });

  /// Create from API JSON response
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json['access_token'] ?? '',
        refreshToken: json['refresh_token'] ?? '',
        tokenType: json['token_type'] ?? 'Bearer',
        expiresIn: json['expires_in'],
      );

  /// Convert to JSON for storage
  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
      };

  /// Check if response is valid
  bool get isValid => accessToken.isNotEmpty && refreshToken.isNotEmpty;
}
