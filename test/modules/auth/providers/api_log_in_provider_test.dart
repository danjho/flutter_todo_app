import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/providers/api_log_in_provider.dart';

import '../../../core/mocks/all_generated_mocks.mocks.dart';
void main() {
  final dio = MockDio();
  final apiLogInProvider = ApiLogInProvider(dio: dio);

  test('Deve retornar um usuário logado', () async {
    when(
      dio.post(any, data: anyNamed('data')),
    ).thenAnswer((_) async {
      return Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(path: 'any_path'),
        statusCode: 200,
        data: {
          'user': {'id': 'uuid', 'email': 'user@email.com', 'name': 'name'},
          'token': 'validToken',
        },
      );
    });

    final user = await apiLogInProvider.logInWithEmail(
      LogInDto(email: 'any_email', pwd: 'any_pwd'),
    );
    expect(user.token, isNotEmpty);
  });

  test(
    'Deve retornar um Exception caso haja erro na execução dio',
    () async {
      when(dio.post(any, data: anyNamed('data'))).thenThrow(Exception());
      final result = apiLogInProvider.logInWithEmail(
        LogInDto(email: 'any_email', pwd: 'any_pwd'),
      );
      expect(result, throwsException);
    },
  );
}
