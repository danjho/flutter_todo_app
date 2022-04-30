import 'package:dartz/dartz.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/core/errors/errors.dart';

abstract class ISignInRepository {
  Future<Either<Failure, User>> signInWithEmail(SignInDto dto);
}
