class CreateUserDto {
  CreateUserDto({
    required this.name,
    required this.email,
    required this.pwd,
    this.pwdConfirmation,
  });

  String name;
  String email;
  String pwd;
  String? pwdConfirmation;

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password': pwd};
  }
}
