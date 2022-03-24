// Mocks generated by Mockito 5.1.0 from annotations
// in todo_app/test/modules/home/data/repositories/task_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/modules/create_task/domain/dtos/create_task_dto.dart'
    as _i6;
import 'package:todo_app/modules/home/data/data_sources/i_task_data_source.dart'
    as _i3;
import 'package:todo_app/modules/home/data/models/task_model.dart' as _i5;
import 'package:todo_app/modules/home/domain/entities/task.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTask_0 extends _i1.Fake implements _i2.Task {}

/// A class which mocks [ITaskDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockITaskDataSource extends _i1.Mock implements _i3.ITaskDataSource {
  MockITaskDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.TaskModel>> getAll() =>
      (super.noSuchMethod(Invocation.method(#getAll, []),
              returnValue: Future<List<_i5.TaskModel>>.value(<_i5.TaskModel>[]))
          as _i4.Future<List<_i5.TaskModel>>);
  @override
  _i4.Future<_i2.Task> create(_i6.CreateTaskDto? dto) =>
      (super.noSuchMethod(Invocation.method(#create, [dto]),
              returnValue: Future<_i2.Task>.value(_FakeTask_0()))
          as _i4.Future<_i2.Task>);
}
