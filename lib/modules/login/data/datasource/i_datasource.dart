import 'package:todo_app/modules/login/domain/entities/user.dart';

abstract class ILoginDatasource {
  Future<User> loginWithEmail(String email, String pwd);
}
