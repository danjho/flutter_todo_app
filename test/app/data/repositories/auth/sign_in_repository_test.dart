import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/data/models/user_model.dart';
import 'package:todo_app/app/data/repositories/auth/sign_in_repository.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final signInProvider = MockISignInProvider();
  final tokenProvider = MockITokenProvider();
  final userProvider = MockIUserProvider();

  final useCase = SignInRepository(
    signInProvider: signInProvider,
    tokenProvider: tokenProvider,
    userProvider: userProvider,
  );

  test('Deve retornar um usuário logado', () async {
    when(signInProvider.signInWithEmail(any)).thenAnswer((_) async {
      return UserModel(email: 'email', token: 'token', name: 'name');
    });

    final result = await useCase.signInWithEmail(
      SignInDto(email: 'any_email', pwd: 'any_pwd'),
    );

    var fold = result.fold(id, id);
    expect(fold, isA<User>());

    final user = fold as User;
    expect(user.token, isNotEmpty);
  });

  test(
    'Deve retornar um DatasourceError em caso de falha no provider',
    () async {
      when(signInProvider.signInWithEmail(any)).thenThrow(Exception());

      final result = await useCase.signInWithEmail(
        SignInDto(email: 'any_email', pwd: 'any_pwd'),
      );
      expect(result.fold(id, id), isA<DatasourceError>());
    },
  );
}
