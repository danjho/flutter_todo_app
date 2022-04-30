import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/app/domain/errors/errors.dart';
import 'package:todo_app/app/domain/use_cases/auth/sign_up_with_email.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/utils/constants.dart';

import '../../../../core/mocks/generated_mocks.mocks.dart';

void main() {
  final repo = MockISignUpRepository();
  final usecase = SignUpWithEmail(repo: repo);
  late SignUpDto dto;

  setUp(() {
    dto =
        SignUpDto(name: 'Any Name', email: 'valid@email.com', pwd: '123mudar');
  });

  group('Deve retornar SignUpInputError', () {
    test('se nome estiver vazio', () async {
      dto.name = '';
      final result = await usecase(dto);
      expect(result.fold(id, id), isA<SignUpInputError>());
    });

    test('se nome não tiver pelo menos 2 partes', () async {
      dto.name = '1_parte';
      final result = await usecase(dto);
      expect(result.fold(id, id), isA<SignUpInputError>());
    });
    test('se o email for inválido', () async {
      dto.email = 'invalid_email';
      final result = await usecase(dto);
      expect(result.fold(id, id), isA<SignUpInputError>());
    });

    test('se o password for menor que $MIN_PASSWORD_LENGTH', () async {
      dto.pwd = '';
      final result = await usecase(dto);
      expect(result.fold(id, id), isA<SignUpInputError>());
    });
  });

  test('Deve retornar um usuário logado', () async {
    when(repo.signUpWithEmail(any)).thenAnswer((_) async {
      final user = User(id: 'id', email: 'validEmail', token: 'validToken');
      return Right(user);
    });

    final result = await usecase(dto);
    expect(result.fold(id, id), isA<User>());
    final user = result.fold(id, id) as User;
    expect(user.token, isNotEmpty);
  });

  test(
    'Deve retornar RepositoryError em caso de falha no repositóro',
    () async {
      when(repo.signUpWithEmail(any)).thenAnswer(
        (_) async => Left(RepositoryError()),
      );
      final result = await usecase(dto);
      expect(result.fold(id, id), isA<RepositoryError>());
    },
  );
}
