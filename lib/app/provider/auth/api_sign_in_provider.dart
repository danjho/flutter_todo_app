import 'package:dio/dio.dart';
import 'package:todo_app/app/data/interfaces/auth/i_sign_in_provider.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/core/end_point.dart';

class ApiSignInProvider implements ISignInProvider {
  ApiSignInProvider({required this.dio});

  final Dio dio;

  @override
  Future<User> signInWithEmail(dto) async {
    var res = await dio.post<Map<String, dynamic>>(
      EndPoint.signIn,
      data: dto.toMap(),
    );
    res.data?['user']['token'] = res.data?['token'];
    return User.fromJson(res.data?['user']);
  }
}
