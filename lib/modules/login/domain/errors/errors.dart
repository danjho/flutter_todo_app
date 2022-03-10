import 'package:todo_app/core/errors/errors.dart';

class InvalidEmailError extends Failure {
  InvalidEmailError({String? message}) : super(message: message);
}

class InvalidPasswordError extends Failure {
  InvalidPasswordError({String? message}) : super(message: message);
}
