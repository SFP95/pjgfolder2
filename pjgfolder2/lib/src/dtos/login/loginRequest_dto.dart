class LoginRequest_dto {

  late String email;
  late String password;

  LoginRequest_dto(this.email, this.password);

  LoginRequest_dto.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

