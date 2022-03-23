import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/validations/email_validation.dart';
import 'package:todo_app/core/validations/password_validation.dart';
import 'package:todo_app/modules/login/domain/dtos/login_dto.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/login/domain/errors/errors.dart';
import 'package:todo_app/modules/login/domain/repositories/i_login_repository.dart';

class LoginWithEmail extends UseCase<User, LoginDto> {
  LoginWithEmail({required this.repo});

  final ILoginRepository repo;

  @override
  Future<Either<Failure, User>> call(LoginDto dto) async {
    try {
      _validateFields(dto);
    } on LoginWithEmailError catch (e) {
      return Left(e);
    } catch (e) {
      Left(LoginWithEmailError(message: 'Erro inesperado'));
    }

    final result = await repo.loginWithEmail(dto);
    if (result.isRight()) {
      final user = result.foldRight(User, (r, previous) => r) as User;
      repo.setToken(user.token ?? '');
    }
    return result;
  }

  void _validateFields(LoginDto dto) {
    final validations = [
      EmailValidation.validate(dto.email),
      PasswordValidation.validate(dto.pwd),
    ];

    for (final element in validations) {
      if (element != null) {
        throw LoginWithEmailError(message: element);
      }
    }
  }
}
