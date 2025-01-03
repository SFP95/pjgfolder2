import '../../models/users/user.dart';
import 'dart:convert';

class RegisterResponse_dto {

  late String token;
  late User user;

  RegisterResponse_dto(this.token, this.user);

  factory RegisterResponse_dto.fromJson(Map<String, dynamic> json) {
    return RegisterResponse_dto(
      json['token'],
      User.fromJson(json['user']),
    );
  }

}