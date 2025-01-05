class RegisterRequest_dto {
  late String alias;
  late String email;
  late String password;

  RegisterRequest_dto(this.alias, this.email, this.password);

  RegisterRequest_dto.fromJson(Map<String, dynamic> json)
      : alias = json['alias'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    return {
      'alias': alias,
      'email': email,
      'password': password,
    };
  }
}
