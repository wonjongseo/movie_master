import 'dart:convert';

class SignupReqParams {
  final String email;
  final String password;

  SignupReqParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  factory SignupReqParams.fromMap(Map<String, dynamic> map) {
    return SignupReqParams(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupReqParams.fromJson(String source) =>
      SignupReqParams.fromMap(json.decode(source));
}
