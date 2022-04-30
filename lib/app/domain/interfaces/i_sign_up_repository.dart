import 'package:dartz/dartz.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/core/errors/errors.dart';

abstract class ISignUpRepository {
  Future<Either<Failure, User>> signUpWithEmail(SignUpDto dto);
}
