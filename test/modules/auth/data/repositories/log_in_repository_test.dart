import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_log_in_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_token_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_user_provider.dart';
import 'package:todo_app/modules/auth/data/repositories/log_in_repository.dart';
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';

import 'log_in_repository_test.mocks.dart';

@GenerateMocks([ILogInProvider, ITokenProvider, IUserProvider])
void main() {
  final logInProvider = MockILogInProvider();
  final tokenProvider = MockITokenProvider();
  final userProvider = MockIUserProvider();

  final useCase = LogInRepository(
    logInProvider: logInProvider,
    tokenProvider: tokenProvider,
    userProvider: userProvider,
  );

  test('Deve retornar um usuário logado', () async {
    when(logInProvider.logInWithEmail(any)).thenAnswer((_) async {
      return User(id: 'id', email: 'email', token: 'token', name: 'name');
    });

    final result = await useCase.logInWithEmail(
      LogInDto(email: 'any_email', pwd: 'any_pwd'),
    );

    var fold = result.fold(id, id);
    expect(fold, isA<User>());

    final user = fold as User;
    expect(user.token, isNotEmpty);
  });

  test(
    'Deve retornar um DatasourceError em caso de falha no provider',
    () async {
      when(logInProvider.logInWithEmail(any)).thenThrow(Exception());

      final result = await useCase.logInWithEmail(
        LogInDto(email: 'any_email', pwd: 'any_pwd'),
      );
      expect(result.fold(id, id), isA<DatasourceError>());
    },
  );
}
