import 'package:get/get.dart';
import 'package:todo_app/modules/auth/data/models/user_model.dart';
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
  late UserModel user;

  HomeState get state => _state();

  List<Category> get noEmptyCategories =>
      categories.where((element) => element.tasks.isNotEmpty).toList();

  @override
  Future<void> onReady() async {
    user = Get.arguments;

    final getAllCategories = GetAllCategories(repo: categoryRepo);
    final catResult = await getAllCategories();
    if (catResult.isRight()) {
      categories = catResult.fold((l) => [], (r) => r);
      categories.sort((a, b) => b.tasks.length.compareTo(a.tasks.length));
      await Future.delayed(Duration(seconds: 1));
      _state(HomeState.done);
    } else {
      print('error');
      _state(HomeState.error);
    }

    // final getTasks = GetAllTasks(repo);
    // final result = await getTasks();
    // if (result.isRight()) {
    //   tasks = result.fold((l) => [], (r) => r);
    //   await Future.delayed(Duration(seconds: 2));
    //   _state(HomeState.done);
    // } else {
    //   _state(HomeState.error);
    // }
    super.onReady();
  }
}
