import 'dart:convert';

class SigninReqParams {
  final String email;
  final String password;

  SigninReqParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  factory SigninReqParams.fromMap(Map<String, dynamic> map) {
    return SigninReqParams(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SigninReqParams.fromJson(String source) =>
      SigninReqParams.fromMap(json.decode(source));
}
