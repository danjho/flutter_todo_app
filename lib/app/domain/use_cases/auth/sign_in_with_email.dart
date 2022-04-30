import 'package:dartz/dartz.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/app/domain/errors/errors.dart';
import 'package:todo_app/app/domain/interfaces/i_sign_in_repository.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/validations/email_validation.dart';
import 'package:todo_app/core/validations/password_validation.dart';

class SignInWithEmail extends UseCase<User, SignInDto> {
  SignInWithEmail({required this.repo});

  final ISignInRepository repo;

  @override
  Future<Either<Failure, User>> call(SignInDto dto) async {
    try {
      _validateFields(dto);

      final result = await repo.signInWithEmail(dto);
      return result;
    } on SignInWithEmailError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(SignInWithEmailError(message: 'Erro inesperado'));
    }
  }

  void _validateFields(SignInDto dto) {
    final validations = [
      EmailValidation.validate(dto.email),
      PasswordValidation.validate(dto.pwd),
    ];

    for (final element in validations) {
      if (element != null) {
        throw SignInWithEmailError(message: element);
      }
    }
  }
}
