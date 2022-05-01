import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/domain/dtos/categories/create_category_dto.dart';
import 'package:todo_app/app/domain/interfaces/i_category_repository.dart';
import 'package:todo_app/app/domain/use_cases/categories/create_category.dart';
import 'package:todo_app/core/errors/errors.dart';

class CategoryCrudController extends GetxController {
  CategoryCrudController(this.categoryRepo);

  final ICategoryRepository categoryRepo;
  final RxBool $isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  CreateCategoryDto dto = CreateCategoryDto.empty();

  Future<void> save() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    $isLoading(true);

    final create = CreateCategory(repo: categoryRepo);
    final res = await create(dto);

    if (res.isLeft()) {
      final error = res.fold(id, id) as Failure;
      Get.showSnackbar(GetSnackBar(
        message: error.message ?? 'Unexpected error',
        duration: Duration(seconds: 2),
      ));
      $isLoading(false);
      return;
    }

    Get.back();
  }
}
