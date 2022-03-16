import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/modules/login/data/data_sources/i_datasource.dart';
import 'package:todo_app/modules/login/data/data_sources/i_token_local_data_source.dart';
import 'package:todo_app/modules/login/data/repositories/login_repository.dart';
import 'package:todo_app/modules/login/domain/dtos/login_dto.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/core/errors/errors.dart';

import 'login_repository_test.mocks.dart';

@GenerateMocks([ILoginDatasource, ITokenLocalDataSource])
void main() {
  final datasource = MockILoginDatasource();
  final localDataSource = MockITokenLocalDataSource();
  final usecase = LoginRepository(
    datasource: datasource,
    localDataSource: localDataSource,
  );

  test('Deve retornar um usuário logado', () async {
    when(datasource.loginWithEmail(any)).thenAnswer((_) async {
      return User(id: 'id', email: 'email', token: 'token');
    });

    final result = await usecase.loginWithEmail(
      LoginDto(email: 'any_email', pwd: 'any_pwd'),
    );

    var fold = result.fold(id, id);
    expect(fold, isA<User>());

    final user = fold as User;
    expect(user.token, isNotEmpty);
  });

  test(
    'Deve retornar um DatasourceError em caso de falha no datasource',
    () async {
      when(datasource.loginWithEmail(any)).thenThrow(Exception());

      final result = await usecase.loginWithEmail(
        LoginDto(email: 'any_email', pwd: 'any_pwd'),
      );
      expect(result.fold(id, id), isA<DatasourceError>());
    },
  );
}
