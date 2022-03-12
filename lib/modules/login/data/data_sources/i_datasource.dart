import 'package:todo_app/modules/login/domain/dtos/login_dto.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';

abstract class ILoginDatasource {
  Future<User> loginWithEmail(LoginDto dto);
}
