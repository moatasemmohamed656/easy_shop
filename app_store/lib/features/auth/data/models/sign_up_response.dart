import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  int? id;
  String? name;
  String? email;
  String? password;
  String? avatar;
  String? role;
  String? creationAt;
  String? updatedAt;

  SignUpResponse({
    this.id,
    this.name,
    this.email,
    this.password,
    this.avatar,
    this.role,
    this.creationAt,
    this.updatedAt,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}
