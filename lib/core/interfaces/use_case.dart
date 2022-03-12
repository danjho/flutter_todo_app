import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';

abstract class UseCase<Type, Dto> {
  Future<Either<Failure, Type>> call(Dto dto);
}
