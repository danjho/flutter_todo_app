import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_sign_up_provider.dart';
import 'package:todo_app/modules/auth/domain/dtos/create_user_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';

class ApiSignUpProvider extends ISignUpProvider {
  ApiSignUpProvider({required this.dio});

  final Dio dio;
  @override
  Future<User> signUpWithEmail(CreateUserDto dto) async {
    final res = await dio.post<Map<String, dynamic>>(
      EndPoint.signUp,
      data: dto.toMap(),
    );
    return User.fromJson(res.data?['user'])..token = res.data?['token'];
  }
}
