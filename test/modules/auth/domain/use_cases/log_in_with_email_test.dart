import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';
import 'package:todo_app/modules/auth/domain/errors/errors.dart';
import 'package:todo_app/modules/auth/domain/use_cases/log_in_with_email.dart';

import '../../../../core/mocks/all_generated_mocks.mocks.dart';
void main() {
  final repo = MockILogInRepository();
  final usecase = LogInWithEmail(repo: repo);

  const email = 'valid@email.com';
  const password = 'validPassword';

  group('Validação de email', () {
    test('Retornar InvalidEmailFailure para email vazio', () async {
      final result = await usecase(LogInDto(email: '', pwd: 'any_password'));
      expect(result.fold(id, id), isA<LogInWithEmailError>());
    });

    test('Retornar InvalidEmailFailure para email fora do padrão', () async {
      final result = await usecase(LogInDto(
        email: 'invalid_email',
        pwd: 'any_password',
      ));
      expect(result.fold(id, id), isA<LogInWithEmailError>());
    });
  });

  group('Validação de password', () {
    test('Retornar InvalidPasswordFailure para password vazio', () async {
      final result = await usecase(LogInDto(email: email, pwd: ''));
      expect(result.fold(id, id), isA<LogInWithEmailError>());
    });

    test(
      'Retornar InvalidPasswordFailure se o password não tiver a quantidade de caractere necessários',
      () async {
        final result = await usecase(LogInDto(email: email, pwd: 'any'));
        expect(result.fold(id, id), isA<LogInWithEmailError>());
      },
    );
  });

  test('Deve retornar um usuário logado', () async {
    when(repo.logInWithEmail(any)).thenAnswer((_) async {
      return Right(User(id: 'id', email: email));
    });

    final result = await usecase(LogInDto(email: email, pwd: password));
    expect(result.isRight(), true);
  });

  test('Deve retornar Failure em caso de falha no repositório', () async {
    when(repo.logInWithEmail(any))
        .thenAnswer((_) async => Left(RepositoryError()));
    final result = await usecase(LogInDto(email: email, pwd: password));
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
