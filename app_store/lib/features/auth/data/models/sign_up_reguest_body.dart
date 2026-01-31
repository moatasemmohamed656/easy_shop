import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_reguest_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  String? name;
  String? email;
  String? password;
  String? avatar;


  SignUpRequestBody({
    this.name,
    this.email,
    this.password,
    this.avatar,
  });

  
  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);

}


