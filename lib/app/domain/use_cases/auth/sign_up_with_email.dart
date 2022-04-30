import 'package:dartz/dartz.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/app/domain/errors/errors.dart';
import 'package:todo_app/app/domain/interfaces/i_sign_up_repository.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/validations/email_validation.dart';
import 'package:todo_app/core/validations/name_validation.dart';
import 'package:todo_app/core/validations/password_validation.dart';

class SignUpWithEmail extends UseCase<User, SignUpDto> {
  SignUpWithEmail({required this.repo});

  final ISignUpRepository repo;

  @override
  Future<Either<Failure, User>> call(SignUpDto dto) async {
    try {
      _validateFields(dto);
    } on SignUpInputError catch (e) {
      return Left(e);
    } catch (e) {
      Left(SignUpInputError(message: 'Erro inesperado'));
    }

    return repo.signUpWithEmail(dto);
  }

  void _validateFields(SignUpDto dto) {
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
