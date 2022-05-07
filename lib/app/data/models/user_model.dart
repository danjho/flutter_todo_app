import 'package:todo_app/app/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required String email,
    String? imageUrl,
    String? token,
  }) : super(
          name: name,
          email: email,
          imageUrl: imageUrl,
          token: token,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'imageUrl': imageUrl,
        'token': token,
      };
}
