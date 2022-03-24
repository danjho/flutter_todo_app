import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';

abstract class ILogInRepository {
  Future<Either<Failure, User>> logInWithEmail(LogInDto dto);
}
