import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/login/domain/errors/errors.dart';
import 'package:todo_app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:todo_app/shared/errors/errors.dart';
import 'package:todo_app/shared/interfaces/use_case.dart';
import 'package:todo_app/utils/constants.dart';

class LoginWithEmail extends UseCase<User, Params> {
  LoginWithEmail({required this.repo});

  final ILoginRepository repo;

  @override
  Future<Either<Failure, User>> call(Params params) async {
    final email = params.email;
    final password = params.password;

    if (email.isEmpty || !email.isEmail) {
      return Left(InvalidEmailFailure());
    }

    if (password.isEmpty || password.length.isLowerThan(MIN_PASSWORD_LENGTH)) {
      return Left(InvalidPasswordFailure());
    }

    try {
      return repo.loginWithEmail(email, password);
    } catch (e) {
      return Left(RepositoryFailure());
    }
  }
}

class Params {
  Params({
    required this.email,
    required this.password,
  });
  String email;
  String password;
}
