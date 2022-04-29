class User {
  User({
    this.id = '',
    this.name = '',
    this.email = '',
    this.imageUrl = '',
    this.token = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '' ?? '',
      email: json['email'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      token: json['token'] ?? '',
    );
  }

  String id;
  String name;
  String email;
  String imageUrl;
  String token;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'imageUrl': imageUrl,
        'token': token,
      };
}
