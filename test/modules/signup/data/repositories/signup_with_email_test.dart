import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/login/data/models/user_model.dart';
import 'package:todo_app/modules/signup/data/data_sources/i_signup_data_source.dart';
import 'package:todo_app/modules/signup/data/repositories/signup_with_email_repository.dart';
import 'package:todo_app/modules/signup/domain/use_cases/signup_with_email.dart';

import 'signup_with_email_test.mocks.dart';

@GenerateMocks([ISignupDataSource])
void main() {
  final dataSource = MockISignupDataSource();
  final repo = SignupWithEmailRepository(dataSource: dataSource);
  test('Deve retornar um usuário logado', () async {
    when(dataSource.signupWithEmail(any)).thenAnswer((_) async {
      return UserModel(id: 'id', email: 'valid@email.com', token: 'validToken');
    });
    final result = await repo.signupWithEmail(
      Params(name: 'name', email: 'email', pwd: 'pwd'),
    );
    final fold = result.fold(id, id);
    expect(fold, isA<UserModel>());
    expect((fold as UserModel).token, isNotEmpty);
  });

  test('Deve retornar DatasourceError um usuário logado', () async {
    when(dataSource.signupWithEmail(any)).thenThrow(Exception());
    final result = await repo.signupWithEmail(
      Params(name: 'name', email: 'email', pwd: 'pwd'),
    );
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
