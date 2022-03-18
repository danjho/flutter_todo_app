import 'package:dio/dio.dart';
import 'package:todo_app/core/end_point.dart';
import 'package:todo_app/modules/home/data/data_sources/i_task_data_source.dart';
import 'package:todo_app/modules/home/data/models/task_model.dart';

class ApiTaskDataSource extends ITaskDataSource {
  ApiTaskDataSource({required this.dio});

  final Dio dio;

  @override
  Future<List<TaskModel>> getAll() async {
    final res = await dio.get(EndPoint.tasks);
    return TaskModel.fromList(res.data);
  }
}
