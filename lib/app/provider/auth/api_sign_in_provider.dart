import 'package:dio/dio.dart';
import 'package:todo_app/app/data/interfaces/auth/i_sign_in_provider.dart';
import 'package:todo_app/app/data/models/user_model.dart';
import 'package:todo_app/core/end_point.dart';

class ApiSignInProvider implements ISignInProvider {
  ApiSignInProvider({required this.dio});

  final Dio dio;

  @override
  Future<UserModel> signInWithEmail(dto) async {
    var res = await dio.post<Map<String, dynamic>>(
      EndPoint.signIn,
      data: dto.toMap(),
    );

    Map<String, dynamic> json = res.data?['user'];
    json['token'] = res.data?['token'];
    return UserModel.fromJson(json);
  }
}
