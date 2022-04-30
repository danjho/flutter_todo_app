import 'package:dio/dio.dart';
import 'package:todo_app/app/data/interfaces/auth/i_sign_up_provider.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/core/end_point.dart';

class ApiSignUpProvider extends ISignUpProvider {
  ApiSignUpProvider({required this.dio});

  final Dio dio;

  @override
  Future<User> signUpWithEmail(SignUpDto dto) async {
    final res = await dio.post<Map<String, dynamic>>(
      EndPoint.signUp,
      data: dto.toMap(),
    );
    return User.fromJson(res.data?['user'])..token = res.data?['token'];
  }
}
