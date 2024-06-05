class LoginResponse {
  final String token;
  final String email;

  LoginResponse({
    required this.token,
    required this.email,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
