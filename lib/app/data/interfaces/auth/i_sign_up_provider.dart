import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';

abstract class ISignUpProvider {
  Future<User> signUpWithEmail(SignUpDto dto);
}
