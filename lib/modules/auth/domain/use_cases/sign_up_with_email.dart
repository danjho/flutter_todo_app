import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/validations/email_validation.dart';
import 'package:todo_app/core/validations/name_validation.dart';
import 'package:todo_app/core/validations/password_validation.dart';
import 'package:todo_app/modules/auth/domain/dtos/create_user_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';
import 'package:todo_app/modules/auth/domain/errors/errors.dart';
import 'package:todo_app/modules/auth/domain/interfaces/i_sign_up_repository.dart';

class SignUpWithEmail extends UseCase<User, CreateUserDto> {
  SignUpWithEmail({required this.repo});

  final ISignUpRepository repo;

  @override
  Future<Either<Failure, User>> call(CreateUserDto dto) async {
    try {
      _validateFields(dto);
    } on SignUpInputError catch (e) {
      return Left(e);
    } catch (e) {
      Left(SignUpInputError(message: 'Erro inesperado'));
    }

    final result = await repo.signUpWithEmail(dto);
    if (result.isRight()) {
      final user = result.foldRight(User, (r, previous) => r) as User;
      repo.setToken(user.token ?? '');
    }
    return result;
  }

  void _validateFields(CreateUserDto dto) {
    final validations = [
      NameValidation.validate(dto.name),
      EmailValidation.validate(dto.email),
      PasswordValidation.validate(dto.pwd),
    ];

    for (final element in validations) {
      if (element != null) {
        throw SignUpInputError(message: element);
      }
    }
  }
}
