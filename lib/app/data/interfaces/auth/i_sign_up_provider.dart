import 'package:todo_app/app/data/models/user_model.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';

abstract class ISignUpProvider {
  Future<UserModel> signUpWithEmail(SignUpDto dto);
}
