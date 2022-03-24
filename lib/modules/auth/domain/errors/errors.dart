import 'package:todo_app/core/errors/errors.dart';

class SignUpInputError extends RepositoryError {
  SignUpInputError({String? message}) : super(message: message);
}

class LogInWithEmailError extends Failure {
  LogInWithEmailError({String? message}) : super(message: message);
}
