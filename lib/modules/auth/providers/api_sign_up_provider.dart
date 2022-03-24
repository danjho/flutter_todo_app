import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_sign_up_provider.dart';
import 'package:todo_app/modules/auth/data/models/user_model.dart';
import 'package:todo_app/modules/auth/domain/dtos/create_user_dto.dart';

class ApiSignUpProvider extends ISignUpProvider {
  ApiSignUpProvider({required this.dio});

  final Dio dio;
  @override
  Future<UserModel> signUpWithEmail(CreateUserDto dto) async {
    final res = await dio.post<Map<String, dynamic>>(
      EndPoint.signUp,
      data: dto.toMap(),
    );
    return UserModel.fromJson(res.data?['user'])..token = res.data?['token'];
  }
}
