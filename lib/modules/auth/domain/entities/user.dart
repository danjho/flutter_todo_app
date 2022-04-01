import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'],
      email: map['email'] ?? '',
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
