import 'package:get/get.dart';
import 'package:todo_app/app_globals.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';
import 'package:todo_app/modules/categories/data/repositories/category_repository.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';
import 'package:todo_app/modules/categories/domain/use_cases/get_all_categories.dart';
import 'package:todo_app/modules/tasks/data/repositories/task_repository.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';

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

  List<Task> tasks = [];
  List<Category> categories = [];
  User? get user => AppGlobals.user;

  HomeState get state => _state();

  @override
  Future<void> onReady() async {
    final getAllCategories = GetAllCategories(repo: categoryRepo);
    final catResult = await getAllCategories();
    
    if (catResult.isRight()) {
      categories = catResult.fold((l) => [], (r) => r);
      categories.sort((a, b) => b.totalTasks.compareTo(a.totalTasks));
      _state(HomeState.done);
    } else {
      _state(HomeState.error);
    }

    super.onReady();
  }
}
