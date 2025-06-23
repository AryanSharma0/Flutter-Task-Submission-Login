import 'dart:convert';

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({
    required this.email,
    required this.password,
  });

  /// Convert to JSON for API request
  Map<String, dynamic> toJson() => {
        'email': email.trim(),
        'password': password,
      };

  /// Create from JSON (useful for testing)
  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json['email'] ?? '',
        password: json['password'] ?? '',
      );

  @override
  String toString() => json.encode(toJson());

  /// Create copy with optional field updates
  LoginRequest copyWith({
    String? email,
    String? password,
  }) =>
      LoginRequest(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
