// Mocks generated by Mockito 5.1.0 from annotations
// in todo_app/test/modules/auth/data/repositories/log_in_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/modules/auth/data/interfaces/i_log_in_provider.dart'
    as _i3;
import 'package:todo_app/modules/auth/data/interfaces/i_token_provider.dart'
    as _i6;
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart' as _i5;
import 'package:todo_app/modules/auth/domain/entities/user.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUser_0 extends _i1.Fake implements _i2.User {}

/// A class which mocks [ILogInProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockILogInProvider extends _i1.Mock implements _i3.ILogInProvider {
  MockILogInProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.User> logInWithEmail(_i5.LogInDto? dto) =>
      (super.noSuchMethod(Invocation.method(#logInWithEmail, [dto]),
              returnValue: Future<_i2.User>.value(_FakeUser_0()))
          as _i4.Future<_i2.User>);
}

/// A class which mocks [ITokenProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockITokenProvider extends _i1.Mock implements _i6.ITokenProvider {
  MockITokenProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> setToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#setToken, [token]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<String?> getToken() =>
      (super.noSuchMethod(Invocation.method(#getToken, []),
          returnValue: Future<String?>.value()) as _i4.Future<String?>);
}