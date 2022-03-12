import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/signup/domain/errors/errors.dart';
import 'package:todo_app/modules/signup/domain/repositories/i_signup_repository.dart';
import 'package:todo_app/modules/signup/domain/use_cases/signup_with_email.dart';

import 'signup_with_email_test.mocks.dart';

@GenerateMocks([ISignupRepository])
void main() {
  final repo = MockISignupRepository();
  final usecase = SignupWithEmail(repo: repo);
  late Params params;

  setUp(() {
    params =
        Params(name: 'Any Name', email: 'valid@email.com', pwd: '123mudar');
  });

  group('Deve retornar SignupInputError', () {
    test('se nome estiver vazio', () async {
      params.name = '';
      final result = await usecase(params);
      expect(result.fold(id, id), isA<SignupInputError>());
    });

    test('se nome não tiver pelo menos 2 partes', () async {
      params.name = '1_parte';
      final result = await usecase(params);
      expect(result.fold(id, id), isA<SignupInputError>());
    });
    test('se o email for inválido', () async {
      params.email = 'invalid_email';
      final result = await usecase(params);
      expect(result.fold(id, id), isA<SignupInputError>());
    });

    test('se o password for menor que $MIN_PASSWORD_LENGTH', () async {
      params.pwd = '';
      final result = await usecase(params);
      expect(result.fold(id, id), isA<SignupInputError>());
    });
  });

  test('Deve retornar um usuário logado', () async {
    when(repo.signupWithEmail(any)).thenAnswer((_) async {
      final user = User(id: 'id', email: 'validEmail', token: 'validToken');
      return Right(user);
    });

    final result = await usecase(params);
    expect(result.fold(id, id), isA<User>());
    final user = result.fold(id, id) as User;
    expect(user.token, isNotEmpty);
  });

  test(
    'Deve retornar RepositoryError em caso de falha no repositóro',
    () async {
      when(repo.signupWithEmail(any)).thenThrow(Exception);
      final result = await usecase(params);
      expect(result.fold(id, id), isA<RepositoryError>());
    },
  );
}
