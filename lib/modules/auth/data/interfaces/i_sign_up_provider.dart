import 'package:todo_app/modules/auth/domain/dtos/create_user_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';

abstract class ISignUpProvider {
  Future<User> signUpWithEmail(CreateUserDto dto);
}
