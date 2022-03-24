import 'package:todo_app/core/errors/errors.dart';

class TaskInputError extends Failure {
  TaskInputError({String? message}) : super(message: message);
}
