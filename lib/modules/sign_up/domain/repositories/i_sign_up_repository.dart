import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/sign_up/domain/dtos/sign_up_dto.dart';

abstract class ISignUpRepository {
  Future<Either<Failure, User>> signUpWithEmail(SignUpDto dto);
}
