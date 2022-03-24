import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/auth/domain/dtos/create_user_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';

abstract class ISignUpRepository {
  Future<Either<Failure, User>> signUpWithEmail(CreateUserDto dto);
  Future<void> setToken(String token);
  Future<String?> getToken();
}
