import 'package:json_annotation/json_annotation.dart';
part 'user_profile_response.g.dart';

@JsonSerializable()
class UserProfileResponse {
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  UserProfileResponse({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}
