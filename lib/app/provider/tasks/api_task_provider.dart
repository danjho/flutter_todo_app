import 'package:dio/dio.dart';
import 'package:todo_app/app/data/interfaces/tasks/i_task_provider.dart';
import 'package:todo_app/app/domain/dtos/tasks/create_task_dto.dart';
import 'package:todo_app/app/domain/entities/task.dart';
import 'package:todo_app/core/end_point.dart';

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