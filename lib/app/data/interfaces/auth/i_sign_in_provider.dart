import 'package:todo_app/app/data/models/user_model.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';

abstract class ISignInProvider {
  Future<UserModel> signInWithEmail(SignInDto dto);
}
