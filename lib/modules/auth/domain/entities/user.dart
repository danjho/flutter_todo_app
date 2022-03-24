class User {
  User({
    required this.id,
    required this.email,
    this.token,
  });

  String id;
  String email;
  String? token;
}
