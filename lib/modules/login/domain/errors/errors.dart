import 'package:todo_app/core/errors/errors.dart';

class LoginWithEmailError extends Failure {
  LoginWithEmailError({String? message}) : super(message: message);
}
