import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/login/domain/dtos/login_dto.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/login/domain/errors/errors.dart';
import 'package:todo_app/modules/login/domain/repositories/i_login_repository.dart';

class LoginWithEmail extends UseCase<User, LoginDto> {
  LoginWithEmail({required this.repo});

  final ILoginRepository repo;

  @override
  Future<Either<Failure, User>> call(LoginDto dto) async {
    final email = dto.email;
    final password = dto.pwd;

    if (email.isEmpty || !email.isEmail) {
      return Left(InvalidEmailError());
    }

    if (password.isEmpty || password.length.isLowerThan(MIN_PASSWORD_LENGTH)) {
      return Left(InvalidPasswordError());
    }

    try {
      return repo.loginWithEmail(email, password);
    } catch (e) {
      return Left(RepositoryError());
    }
  }
}
