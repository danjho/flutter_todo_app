import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/app/domain/errors/errors.dart';
import 'package:todo_app/app/domain/use_cases/auth/sign_in_with_email.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final repo = MockISignInRepository();
  final usecase = SignInWithEmail(repo: repo);

  const email = 'valid@email.com';
  const password = 'validPassword';

  group('Validação de email', () {
    test('Retornar InvalidEmailFailure para email vazio', () async {
      final result = await usecase(SignInDto(email: '', pwd: 'any_password'));
      expect(result.fold(id, id), isA<SignInWithEmailError>());
    });

    test('Retornar InvalidEmailFailure para email fora do padrão', () async {
      final result = await usecase(SignInDto(
        email: 'invalid_email',
        pwd: 'any_password',
      ));
      expect(result.fold(id, id), isA<SignInWithEmailError>());
    });
  });

  group('Validação de password', () {
    test('Retornar InvalidPasswordFailure para password vazio', () async {
      final result = await usecase(SignInDto(email: email, pwd: ''));
      expect(result.fold(id, id), isA<SignInWithEmailError>());
    });

    test(
      'Retornar InvalidPasswordFailure se o password não tiver a quantidade de caractere necessários',
      () async {
        final result = await usecase(SignInDto(email: email, pwd: 'any'));
        expect(result.fold(id, id), isA<SignInWithEmailError>());
      },
    );
  });

  test('Deve retornar um usuário logado', () async {
    when(repo.signInWithEmail(any)).thenAnswer((_) async {
      return Right(User(id: 0, email: email));
    });

    final result = await usecase(SignInDto(email: email, pwd: password));
    expect(result.isRight(), true);
  });

  test('Deve retornar Failure em caso de falha no repositório', () async {
    when(repo.signInWithEmail(any))
        .thenAnswer((_) async => Left(RepositoryError()));
    final result = await usecase(SignInDto(email: email, pwd: password));
    expect(result.fold(id, id), isA<RepositoryError>());
  });
}
