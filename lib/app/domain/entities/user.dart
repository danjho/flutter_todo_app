class User {
  User({
    required this.name,
    required this.email,
    this.imageUrl,
    this.token,
  });

  String name;
  String email;
  String? imageUrl;
  String? token;
}
