import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/modules/login/externals/data_sources/api_login_data_source.dart';

import 'api_login_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dio = MockDio();
  final dataSource = ApiLoginDataSource(dio: dio);

  test('Deve retornar um usuário logado', () async {
    when(
      dio.post(any),
    ).thenAnswer((_) async {
      return Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(path: 'any_path'),
        statusCode: 200,
        data: {
          'user': {'id': 'uuid', 'email': 'user@email.com'},
          'token': 'validToken',
        },
      );
    });

    final user = await dataSource.loginWithEmail('any_email', 'any_pwd');
    expect(user.token, isNotEmpty);
  });

  test(
    'Deve retornar um Exception caso haja erro na execução dio',
    () async {
      when(dio.post(any)).thenThrow(Exception());
      final result = dataSource.loginWithEmail('any_email', 'any_pwd');
      expect(result, throwsException);
    },
  );
}
