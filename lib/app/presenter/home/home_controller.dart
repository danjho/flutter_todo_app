import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/repositories/categories/category_repository.dart';
import 'package:todo_app/app/data/repositories/tasks/task_repository.dart';
import 'package:todo_app/app/domain/dtos/tasks/update_task_dto.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/domain/entities/task.dart' as t;
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/app/domain/use_cases/categories/get_all_categories.dart';
import 'package:todo_app/app/domain/use_cases/tasks/get_all_tasks.dart';
import 'package:todo_app/app/domain/use_cases/tasks/update_task.dart';
import 'package:todo_app/app_globals.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/routes/app_routes.dart';

enum HomeState {
  requesting,
  done,
  error,
}

class HomeController extends GetxController {
  HomeController({required this.taskRepo, required this.categoryRepo});

  final TaskRepository taskRepo;
  final CategoryRepository categoryRepo;
  final Rx<HomeState> _state = HomeState.requesting.obs;

  List<t.Task> tasks = [];
  List<Category> categories = [];

  User? get user => AppGlobals.user;

  HomeState get state => _state();

  @override
  void onReady() {
    super.onReady();

    _fetchAll();
  }

  Future<void> _fetchAll() async {
    _state(HomeState.requesting);

    final getAllCategories = GetAllCategories(repo: categoryRepo);
    final catResult = await getAllCategories();

    if (catResult.isRight()) {
      categories = catResult.fold((l) => [], (r) => r);
      categories.sort((a, b) => b.totalTasks.compareTo(a.totalTasks));
    } else {
      _state(HomeState.error);
      return;
    }

    final getAllTasks = GetAllTasks(taskRepo);
    final taskResult = await getAllTasks();

    if (taskResult.isRight()) {
      tasks = taskResult.fold(id, id) as List<t.Task>;
      tasks.sort((a, b) => a.done! ? 1 : 0);
    } else {
      _state(HomeState.error);
      return;
    }

    _state(HomeState.done);
  }

  Future<void> newTask() async {
    await Get.toNamed(AppRoutes.taskCrud);
    _fetchAll();
  }

  Future<void> updateTask(t.Task task) async {
    final update = UpdateTask(taskRepo);
    final result = await update(UpdateTaskDto(
      category: task.category ?? 0,
      color: task.color,
      date: task.date,
      done: task.done,
      id: task.id,
      title: task.title,
    ));

    if (result.isLeft()) {
      final error = result.fold(id, id) as Failure;
      Get.showSnackbar(GetSnackBar(
        message: error.message ?? 'Unexpected error',
        duration: Duration(seconds: 2),
      ));
      return;
    }

    _fetchAll();
  }
}
