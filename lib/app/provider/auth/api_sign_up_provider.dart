import 'package:dio/dio.dart';
import 'package:todo_app/app/data/interfaces/auth/i_sign_up_provider.dart';
import 'package:todo_app/app/data/models/user_model.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/core/end_point.dart';

class ApiSignUpProvider extends ISignUpProvider {
  ApiSignUpProvider({required this.dio});

  final Dio dio;

  @override
  Future<UserModel> signUpWithEmail(SignUpDto dto) async {
    final res = await dio.post<Map<String, dynamic>>(
      EndPoint.signUp,
      data: dto.toMap(),
    );
    Map<String, dynamic> json = res.data?['user'];
    json['token'] = res.data?['token'];
    return UserModel.fromJson(json);
  }
}
