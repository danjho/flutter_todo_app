import 'package:dio/dio.dart';
import 'package:todo_app/modules/login/data/data_sources/i_datasource.dart';
import 'package:todo_app/modules/login/data/models/user_model.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';

class ApiLoginDataSource implements ILoginDatasource {
  ApiLoginDataSource({required this.dio});

  final Dio dio;

  @override
  Future<User> loginWithEmail(String email, String pwd) async {
    final res = await dio.post<Map<String, dynamic>>('');
    return UserModel.fromJson(res.data?['user'])..token = res.data?['token'];
  }
}
