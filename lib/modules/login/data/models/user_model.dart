import 'package:todo_app/modules/login/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String email,
    String? token,
  }) : super(
          id: id,
          email: email,
          token: token,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'token': token,
      };
}
