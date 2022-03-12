import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/signup/domain/use_cases/signup_with_email.dart';

abstract class ISignupRepository {
  Future<Either<Failure, User>> signupWithEmail(Params params);
}
