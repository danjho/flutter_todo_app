import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/interfaces/use_case.dart';
import 'package:todo_app/core/validations/email_validation.dart';
import 'package:todo_app/core/validations/password_validation.dart';
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';
import 'package:todo_app/modules/auth/domain/interfaces/i_log_in_repository.dart';
import 'package:todo_app/modules/auth/domain/errors/errors.dart';

class LogInWithEmail extends UseCase<User, LogInDto> {
  LogInWithEmail({required this.repo});

  final ILogInRepository repo;

  @override
  Future<Either<Failure, User>> call(LogInDto dto) async {
    try {
      _validateFields(dto);
    } on LogInWithEmailError catch (e) {
      return Left(e);
    } catch (e) {
      Left(LogInWithEmailError(message: 'Erro inesperado'));
    }

    final result = await repo.logInWithEmail(dto);
    return result;
  }

  void _validateFields(LogInDto dto) {
    final validations = [
      EmailValidation.validate(dto.email),
      PasswordValidation.validate(dto.pwd),
    ];

    for (final element in validations) {
      if (element != null) {
        throw LogInWithEmailError(message: element);
      }
    }
  }
}
