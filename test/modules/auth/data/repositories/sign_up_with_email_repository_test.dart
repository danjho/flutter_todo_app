import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_sign_up_provider.dart';
import 'package:todo_app/modules/auth/data/models/user_model.dart';
import 'package:todo_app/modules/auth/data/repositories/sign_up_with_email_repository.dart';
import 'package:todo_app/modules/auth/domain/dtos/create_user_dto.dart';

import 'log_in_repository_test.mocks.dart';
import 'sign_up_with_email_repository_test.mocks.dart';

@GenerateMocks([ISignUpProvider])
void main() {
  final signUpProvider = MockISignUpProvider();
  final tokenProvider = MockITokenProvider();
  final repo = SignUpWithEmailRepository(
    signUpProvider: signUpProvider,
    tokenProvider: tokenProvider,
  );
  test('Deve retornar um usuário logado', () async {
    when(signUpProvider.signUpWithEmail(any)).thenAnswer((_) async {
      return UserModel(id: 'id', email: 'valid@email.com', token: 'validToken');
    });
    final result = await repo.signUpWithEmail(
      CreateUserDto(name: 'name', email: 'email', pwd: 'pwd'),
    );
    final fold = result.fold(id, id);
    expect(fold, isA<UserModel>());
    expect((fold as UserModel).token, isNotEmpty);
  });

  test('Deve retornar DatasourceError um usuário logado', () async {
    when(signUpProvider.signUpWithEmail(any)).thenThrow(Exception());
    final result = await repo.signUpWithEmail(
      CreateUserDto(name: 'name', email: 'email', pwd: 'pwd'),
    );
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
