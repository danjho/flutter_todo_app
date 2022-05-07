import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';
import 'package:todo_app/app/provider/auth/api_sign_in_provider.dart';

import '../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final dio = MockDio();
  final apiSignInProvider = ApiSignInProvider(dio: dio);

  test('Deve retornar um usuário logado', () async {
    when(
      dio.post(any, data: anyNamed('data')),
    ).thenAnswer((_) async {
      return Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(path: 'any_path'),
        statusCode: 200,
        data: {
          'user': {'id': 0, 'email': 'user@email.com', 'name': 'name'},
          'token': 'validToken',
        },
      );
    });

    final user = await apiSignInProvider.signInWithEmail(
      SignInDto(email: 'any_email', pwd: 'any_pwd'),
    );
    expect(user.token, isNotEmpty);
  });

  test(
    'Deve retornar um Exception caso haja erro na execução dio',
    () async {
      when(dio.post(any, data: anyNamed('data'))).thenThrow(Exception());
      final result = apiSignInProvider.signInWithEmail(
        SignInDto(email: 'any_email', pwd: 'any_pwd'),
      );
      expect(result, throwsException);
    },
  );
}
