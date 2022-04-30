import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';

abstract class ISignInProvider {
  Future<User> signInWithEmail(SignInDto dto);
}
