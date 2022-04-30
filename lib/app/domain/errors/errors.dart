import 'package:todo_app/core/errors/errors.dart';

class SignUpInputError extends RepositoryError {
  SignUpInputError({String? message}) : super(message: message);
}

class SignInWithEmailError extends Failure {
  SignInWithEmailError({String? message}) : super(message: message);
}

class CategoryInputError extends Failure {
  CategoryInputError({String? message}) : super(message: message);
}

class TaskInputError extends Failure {
  TaskInputError({String? message}) : super(message: message);
}
