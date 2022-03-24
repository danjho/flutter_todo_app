class LogInDto {
  LogInDto({required this.email, required this.pwd});

  String email;
  String pwd;

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': pwd};
  }
}
