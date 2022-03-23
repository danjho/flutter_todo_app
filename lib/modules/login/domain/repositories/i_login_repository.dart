import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/login/domain/dtos/login_dto.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/core/errors/errors.dart';

abstract class ILoginRepository {
  Future<Either<Failure, User>> loginWithEmail(LoginDto dto);
  Future<void> setToken(String token);
  Future<String?> getToken();
}
