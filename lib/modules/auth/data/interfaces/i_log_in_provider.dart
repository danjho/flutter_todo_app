import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';

abstract class ILogInProvider {
  Future<User> logInWithEmail(LogInDto dto);
}
