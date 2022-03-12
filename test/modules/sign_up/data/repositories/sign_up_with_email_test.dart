import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/login/data/models/user_model.dart';
import 'package:todo_app/modules/sign_up/data/data_sources/i_sign_up_data_source.dart';
import 'package:todo_app/modules/sign_up/data/repositories/sign_up_with_email_repository.dart';
import 'package:todo_app/modules/sign_up/domain/dtos/sign_up_dto.dart';

import 'sign_up_with_email_test.mocks.dart';

@GenerateMocks([ISignUpDataSource])
void main() {
  final dataSource = MockISignUpDataSource();
  final repo = SignUpWithEmailRepository(dataSource: dataSource);
  test('Deve retornar um usuário logado', () async {
    when(dataSource.signUpWithEmail(any)).thenAnswer((_) async {
      return UserModel(id: 'id', email: 'valid@email.com', token: 'validToken');
    });
    final result = await repo.signUpWithEmail(
      SignUpDto(name: 'name', email: 'email', pwd: 'pwd'),
    );
    final fold = result.fold(id, id);
    expect(fold, isA<UserModel>());
    expect((fold as UserModel).token, isNotEmpty);
  });

  test('Deve retornar DatasourceError um usuário logado', () async {
    when(dataSource.signUpWithEmail(any)).thenThrow(Exception());
    final result = await repo.signUpWithEmail(
      SignUpDto(name: 'name', email: 'email', pwd: 'pwd'),
    );
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
