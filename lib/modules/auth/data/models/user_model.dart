import 'package:todo_app/modules/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String email,
    String? name,
    String? token,
  }) : super(
          id: id,
          email: email,
          token: token,
          name: name,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        token: json['token'],
        name: json['name'],
      );
}
