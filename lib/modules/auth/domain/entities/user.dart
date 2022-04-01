class User {
  User({
    required this.id,
    required this.email,
    this.name,
    this.token,
  });

  String id;
  String? name;
  String email;
  String? token;
}
