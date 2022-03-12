class LoginDto {
  LoginDto({required this.email, required this.pwd});

  String email;
  String pwd;

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': pwd};
  }
}
