import 'package:get/get.dart';
import 'package:todo_app/modules/tasks/data/repositories/task_repository.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';
import 'package:todo_app/modules/tasks/domain/use_cases/get_all_tasks.dart';

enum HomeState {
  requesting,
  done,
  error,
}

class HomeController extends GetxController {
  HomeController(this.repo);

  final TaskRepository repo;
  final Rx<HomeState> _state = HomeState.requesting.obs;
  List<Task> tasks = [];

  HomeState get state => _state();

  @override
  Future<void> onReady() async {
    final getTasks = GetAllTasks(repo);
    final result = await getTasks();
    if (result.isRight()) {
      tasks = result.fold((l) => [], (r) => r);
      await Future.delayed(Duration(seconds: 2));
      _state(HomeState.done);
    } else {
      _state(HomeState.error);
    }
    super.onReady();
  }
}
