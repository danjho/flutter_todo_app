import 'package:todo_app/modules/login/data/models/user_model.dart';
import 'package:todo_app/modules/sign_up/domain/dtos/sign_up_dto.dart';

abstract class ISignUpDataSource {
  Future<UserModel> signUpWithEmail(SignUpDto dto);
}
