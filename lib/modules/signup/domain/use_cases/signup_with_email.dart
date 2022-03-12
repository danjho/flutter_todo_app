import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/signup/domain/errors/errors.dart';
import 'package:todo_app/modules/signup/domain/repositories/i_signup_repository.dart';

class SignupWithEmail extends UseCase<User, Params> {
  SignupWithEmail({required this.repo});

  final ISignupRepository repo;

  @override
  Future<Either<Failure, User>> call(Params params) async {
    if (params.name.isEmpty) {
      return Left(SignupInputError(message: 'Nome não pode ser vazio'));
    }

    if (params.name.split(' ').length < 2) {
      return Left(SignupInputError(message: 'Nome de ter pelo menos 2 partes'));
    }

    if (!params.email.isEmail) {
      return Left(SignupInputError(message: 'Email inválido'));
    }

    if (params.pwd.length.isLowerThan(MIN_PASSWORD_LENGTH)) {
      return Left(SignupInputError(message: 'Password inválido'));
    }
    try {
      return repo.signupWithEmail(params);
    } catch (e) {
      return Left(RepositoryError());
    }
  }
}

class Params {
  Params({
    required this.name,
    required this.email,
    required this.pwd,
  });
  String name;
  String email;
  String pwd;
}
