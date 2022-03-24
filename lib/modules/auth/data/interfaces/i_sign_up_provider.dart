import 'package:todo_app/modules/auth/data/models/user_model.dart';
import 'package:todo_app/modules/auth/domain/dtos/create_user_dto.dart';

abstract class ISignUpProvider {
  Future<UserModel> signUpWithEmail(CreateUserDto dto);
}
