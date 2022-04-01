import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_log_in_provider.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';

class ApiLogInProvider implements ILogInProvider {
  ApiLogInProvider({required this.dio});

  final Dio dio;

  @override
  Future<User> logInWithEmail(dto) async {
    var res = await dio.post<Map<String, dynamic>>(
      EndPoint.logIn,
      data: dto.toMap(),
    );
    res.data?['user']['token'] = res.data?['token'];
    return User.fromJson(res.data?['user']);
  }
}
