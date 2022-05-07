import 'package:dio/dio.dart';
import 'package:todo_app/app/data/interfaces/tasks/i_task_provider.dart';
import 'package:todo_app/app/data/models/task_model.dart';
import 'package:todo_app/app/domain/dtos/tasks/create_task_dto.dart';
import 'package:todo_app/app/domain/dtos/tasks/update_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart';
import 'package:todo_app/core/end_point.dart';

class ApiTaskProvider extends ITaskProvider {
  ApiTaskProvider({required this.dio});

  final Dio dio;

  @override
  Future<List<Task>> getAll() async {
    final res = await dio.get(EndPoint.tasks);
    return TaskModel.fromList(res.data);
  }

  @override
  Future<Task> create(CreateTaskDto dto) async {
    final res = await dio.post(EndPoint.tasks, data: dto.toJson());
    return TaskModel.fromJson(res.data);
  }

  @override
  Future<Task> update(UpdateTaskDto dto) async {
    final endpoint = '${EndPoint.tasks}/${dto.id}';
    final res = await dio.patch(endpoint, data: dto.toJson());
    return TaskModel.fromJson(res.data);
  }
}
