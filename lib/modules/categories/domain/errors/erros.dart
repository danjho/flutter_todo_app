import 'package:todo_app/core/errors/errors.dart';

class CategoryInputError extends Failure {
  CategoryInputError({String? message}) : super(message: message);
}
