import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/modules/sign_up/domain/dtos/sign_up_dto.dart';
import 'package:todo_app/modules/sign_up/externals/api_sign_up_data_source.dart';

import '../../login/externals/data_sources/api_login_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dio = MockDio();
  final dataSource = ApiSignUpDataSource(dio: dio);

  final dto = SignUpDto(
    name: 'name',
    email: 'valid@email.com',
    pwd: '123mudar',
  );
  test('Deve retornar um usuário do dataSource', () async {
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

    final user = await dataSource.signUpWithEmail(dto);
    expect(user.token, isNotEmpty);
  });

  test('Deve retornar DataSourceError em caso de falha', () async {
    when(dio.post(any)).thenThrow(Exception());
    final future = dataSource.signUpWithEmail(dto);
    expect(future, throwsException);
  });
}
