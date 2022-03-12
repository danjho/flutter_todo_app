import 'package:todo_app/modules/login/data/models/user_model.dart';
import 'package:todo_app/modules/signup/domain/use_cases/signup_with_email.dart';

abstract class ISignupDataSource {
  Future<UserModel> signupWithEmail(Params params);
}
