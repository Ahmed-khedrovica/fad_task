import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  @JsonKey(readValue: _readAccessToken)
  final String accessToken;
  @JsonKey(defaultValue: '')
  final String refreshToken;

  static Object? _readAccessToken(Map json, String key) {
    return json['accessToken'] ?? json['token'] ?? '';
  }

  const LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}