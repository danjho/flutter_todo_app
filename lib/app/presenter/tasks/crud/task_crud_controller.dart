import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/domain/dtos/tasks/create_task_dto.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/domain/interfaces/i_category_repository.dart';
import 'package:todo_app/app/domain/interfaces/i_task_repository.dart';
import 'package:todo_app/app/domain/use_cases/categories/get_all_categories.dart';
import 'package:todo_app/app/domain/use_cases/tasks/create_task.dart';
import 'package:todo_app/app/presenter/categories/crud/category_crud_dialog.dart';
import 'package:todo_app/core/errors/errors.dart';

class TaskCrudController extends GetxController {
  TaskCrudController({required this.taskRepo, required this.categoryRepo});

  final ITaskRepository taskRepo;
  final ICategoryRepository categoryRepo;

  final RxBool _$isLoading = false.obs;
  final Rx _$selectedDate = Rx<DateTime>(DateTime.now());
  final Rx<Category> _$selectedCategory = Rx<Category>(Category(
    name: 'No category',
    color: Colors.grey,
    id: 0,
    totalDoneTasks: 0,
    totalTasks: 0,
  ));

  List<Category> _categories = [];
  CreateTaskDto dto = CreateTaskDto.empty();

  bool get isLoading => _$isLoading();

  List<Category> get categories => _categories;

  set selectedDate(DateTime date) {
    dto.date = date;
    _$selectedDate(date);
  }

  DateTime get selectedDate => _$selectedDate();

  set selectedCategory(Category category) {
    dto.category = category.id;
    _$selectedCategory(category);
  }

  Category get selectedCategory => _$selectedCategory();

  @override
  Future<void> onReady() async {
    await _fetchCategories();
    super.onReady();
  }

  Future<void> _fetchCategories() async {
    _$isLoading(true);

    final getAll = GetAllCategories(repo: categoryRepo);
    final res = await getAll();
    if (res.isLeft()) {
      final error = res.fold(id, id) as Failure;
      Get
        ..back()
        ..showSnackbar(GetSnackBar(
          message: error.message ?? 'Erro inesperado',
        ));
      return;
    }

    _categories = res.fold(id, id) as List<Category>;

    _$isLoading(false);
  }

  Future<void> saveTask() async {
    _$isLoading(true);

    final createTask = CreateTask(repo: taskRepo);
    final res = await createTask(dto);

    _$isLoading(false);

    if (res.isLeft()) {
      final error = res.fold(id, id) as Failure;
      Get.showSnackbar(GetSnackBar(
        message: error.message ?? 'Erro inesperado',
        duration: Duration(seconds: 2),
      ));
      return;
    }

    Get.back();
  }

  void chooseDate() {}

  Future<void> newCategory(BuildContext context) async {
    Get.back();
    await CategoryCrudDialog.show(context);
    _fetchCategories();
  }
}
