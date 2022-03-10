import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/login/domain/errors/errors.dart';
import 'package:todo_app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:todo_app/modules/login/domain/use_cases/login_with_email.dart';
import 'package:todo_app/shared/errors/errors.dart';

import 'login_with_email_test.mocks.dart';

@GenerateMocks([ILoginRepository])
void main() {
  final repo = MockILoginRepository();
  final usecase = LoginWithEmail(repo: repo);

  const email = 'valid@email.com';
  const password = 'validPassword';

  group('Validação de email', () {
    test('Retornar InvalidEmailFailure para email vazio', () async {
      final result = await usecase(Params(email: '', pwd: 'any_password'));
      expect(result.fold(id, id), isA<InvalidEmailFailure>());
    });

    test('Retornar InvalidEmailFailure para email fora do padrão', () async {
      final result = await usecase(Params(
        email: 'invalid_email',
        pwd: 'any_password',
      ));
      expect(result.fold(id, id), isA<InvalidEmailFailure>());
    });
  });

  group('Validação de password', () {
    test('Retornar InvalidPasswordFailure para password vazio', () async {
      final result = await usecase(Params(email: email, pwd: ''));
      expect(result.fold(id, id), isA<InvalidPasswordFailure>());
    });

    test(
      'Retornar InvalidPasswordFailure se o password não tiver a quantidade de caractere necessários',
      () async {
        final result = await usecase(Params(email: email, pwd: 'any'));
        expect(result.fold(id, id), isA<InvalidPasswordFailure>());
      },
    );
  });

  test('Deve retornar um usuário logado', () async {
    when(repo.loginWithEmail(any, any)).thenAnswer((_) async {
      return Right(User(id: 'id', email: email));
    });

    final result = await usecase(Params(email: email, pwd: password));
    expect(result.isRight(), true);
  });

  test('Deve retornar Failure em caso de falha no repositório', () async {
    when(repo.loginWithEmail(any, any)).thenThrow((_) async {
      throw RepositoryFailure();
    });

    final result = await usecase(Params(email: email, pwd: password));
    expect(result.fold(id, id), isA<RepositoryFailure>());
  });
}
