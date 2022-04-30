import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/provider/auth/api_sign_up_provider.dart';

import '../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final dio = MockDio();
  final apiSignUpProvider = ApiSignUpProvider(dio: dio);

  final dto = SignUpDto(
    name: 'name',
    email: 'valid@email.com',
    pwd: '123mudar',
  );
  test('Deve retornar um usuário do provider', () async {
    when(
      dio.post(any, data: anyNamed('data')),
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

    final user = await apiSignUpProvider.signUpWithEmail(dto);
    expect(user.token, isNotEmpty);
  });

  test('Deve retornar providerError em caso de falha', () async {
    when(dio.post(any, data: anyNamed('data'))).thenThrow(Exception());
    final future = apiSignUpProvider.signUpWithEmail(dto);
    expect(future, throwsException);
  });
}
