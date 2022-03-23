import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/validations/email_validation.dart';
import 'package:todo_app/core/validations/name_validation.dart';
import 'package:todo_app/core/validations/password_validation.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/sign_up/domain/dtos/sign_up_dto.dart';
import 'package:todo_app/modules/sign_up/domain/errors/errors.dart';
import 'package:todo_app/modules/sign_up/domain/repositories/i_sign_up_repository.dart';

class SignUpWithEmail extends UseCase<User, SignUpDto> {
  SignUpWithEmail({required this.repo});

  final ISignUpRepository repo;

  @override
  Future<Either<Failure, User>> call(SignUpDto dto) async {
    try {
      _validateFields(dto);
    } on SignupInputError catch (e) {
      return Left(e);
    } catch (e) {
      Left(SignupInputError(message: 'Erro inesperado'));
    }

    final result = await repo.signUpWithEmail(dto);
    if (result.isRight()) {
      final user = result.foldRight(User, (r, previous) => r) as User;
      repo.setToken(user.token ?? '');
    }
    return result;
  }

  void _validateFields(SignUpDto dto) {
    final validations = [
      NameValidation.validate(dto.name),
      EmailValidation.validate(dto.email),
      PasswordValidation.validate(dto.pwd),
    ];

    for (final element in validations) {
      if (element != null) {
        throw SignupInputError(message: element);
      }
    }
  }
}
