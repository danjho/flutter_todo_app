import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/tasks/data/interfaces/i_task_provider.dart';
import 'package:todo_app/modules/tasks/domain/dtos/create_task_dto.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';

class ApiTaskProvider extends ITaskProvider {
  ApiTaskProvider({required this.dio});

  final Dio dio;

  @override
  Future<List<Task>> getAll() async {
    final res = await dio.get(
      EndPoint.tasks,
      queryParameters: {'join': 'category'},
    );
    return Task.fromList(res.data);
  }

  @override
  Future<Task> create(CreateTaskDto dto) async {
    final res = await dio.post(EndPoint.tasks, data: dto.toJson());
    return Task.fromJson(res.data);
  }
}
