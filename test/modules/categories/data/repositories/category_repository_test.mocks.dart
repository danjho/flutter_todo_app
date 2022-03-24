// Mocks generated by Mockito 5.1.0 from annotations
// in todo_app/test/modules/categories/data/repositories/category_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/modules/categories/data/interfaces/i_category_provider.dart'
    as _i3;
import 'package:todo_app/modules/categories/data/models/category_model.dart'
    as _i2;
import 'package:todo_app/modules/categories/domain/dtos/create_category_dto.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeCategoryModel_0 extends _i1.Fake implements _i2.CategoryModel {}

/// A class which mocks [ICategoryProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockICategoryProvider extends _i1.Mock implements _i3.ICategoryProvider {
  MockICategoryProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CategoryModel> create(_i5.CreateCategoryDto? dto) =>
      (super.noSuchMethod(Invocation.method(#create, [dto]),
              returnValue:
                  Future<_i2.CategoryModel>.value(_FakeCategoryModel_0()))
          as _i4.Future<_i2.CategoryModel>);
}
