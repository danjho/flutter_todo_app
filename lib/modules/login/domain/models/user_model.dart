class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String id;
  String name;
  String email;
  String imageUrl;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
    };
  }
}
