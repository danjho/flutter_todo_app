import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_log_in_provider.dart';
import 'package:todo_app/modules/auth/data/models/user_model.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';

class ApiLogInProvider implements ILogInProvider {
  ApiLogInProvider({required this.dio});

  final Dio dio;

  @override
  Future<User> logInWithEmail(dto) async {
    final res = await dio.post<Map<String, dynamic>>(
      EndPoint.logIn,
      data: dto.toMap(),
    );
    return UserModel.fromJson(res.data?['user'])..token = res.data?['token'];
  }
}
