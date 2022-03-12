import 'package:todo_app/core/errors/errors.dart';

class SignupInputError extends RepositoryError {
  SignupInputError({String? message}) : super(message: message);
}
