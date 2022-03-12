import 'package:dio/dio.dart';
import 'package:todo_app/modules/login/data/models/user_model.dart';
import 'package:todo_app/modules/sign_up/data/data_sources/i_sign_up_data_source.dart';
import 'package:todo_app/modules/sign_up/domain/dtos/sign_up_dto.dart';

class ApiSignUpDataSource extends ISignUpDataSource {
  ApiSignUpDataSource({required this.dio});

  final Dio dio;
  @override
  Future<UserModel> signUpWithEmail(SignUpDto dto) async {
    final res = await dio.post<Map<String, dynamic>>('');
    return UserModel.fromJson(res.data?['user'])..token = res.data?['token'];
  }
}
