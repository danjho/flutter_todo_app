import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/sign_up/domain/dtos/sign_up_dto.dart';
import 'package:todo_app/modules/sign_up/domain/errors/errors.dart';
import 'package:todo_app/modules/sign_up/domain/repositories/i_sign_up_repository.dart';

class SignUpWithEmail extends UseCase<User, SignUpDto> {
  SignUpWithEmail({required this.repo});

  final ISignUpRepository repo;

  @override
  Future<Either<Failure, User>> call(SignUpDto dto) async {
    if (dto.name.isEmpty) {
      return Left(SignupInputError(message: 'Nome não pode ser vazio'));
    }

    if (dto.name.split(' ').length < 2) {
      return Left(SignupInputError(message: 'Nome de ter pelo menos 2 partes'));
    }

    if (!dto.email.isEmail) {
      return Left(SignupInputError(message: 'Email inválido'));
    }

    if (dto.pwd.length.isLowerThan(MIN_PASSWORD_LENGTH)) {
      return Left(SignupInputError(message: 'Password inválido'));
    }
    try {
      final result = await repo.signUpWithEmail(dto);
      if (result.isRight()) {
        final user = result.foldRight(User, (r, previous) => r) as User;
        repo.setToken(user.token ?? '');
      }
      return result;
    } catch (e) {
      return Left(RepositoryError());
    }
  }
}
