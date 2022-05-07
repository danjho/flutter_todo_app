import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/data/models/user_model.dart';
import 'package:todo_app/app/data/repositories/auth/sign_up_repository.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/core/errors/errors.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final signUpProvider = MockISignUpProvider();
  final tokenProvider = MockITokenProvider();
  final userProvider = MockIUserProvider();

  final repo = SignUpRepository(
    signUpProvider: signUpProvider,
    tokenProvider: tokenProvider,
    userProvider: userProvider,
  );
  test('Deve retornar um usuário logado', () async {
    when(signUpProvider.signUpWithEmail(any)).thenAnswer((_) async {
      return UserModel(
        email: 'valid@email.com',
        token: 'validToken',
        name: 'Valid Name',
      );
    });
    final result = await repo.signUpWithEmail(
      SignUpDto(name: 'name', email: 'email', pwd: 'pwd'),
    );
    final fold = result.fold(id, id);
    expect(fold, isA<User>());
    expect((fold as User).token, isNotEmpty);
  });

  test('Deve retornar DatasourceError um usuário logado', () async {
    when(signUpProvider.signUpWithEmail(any)).thenThrow(Exception());
    final result = await repo.signUpWithEmail(
      SignUpDto(name: 'name', email: 'email', pwd: 'pwd'),
    );
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
