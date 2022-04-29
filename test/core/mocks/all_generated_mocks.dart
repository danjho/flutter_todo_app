import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_log_in_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_sign_up_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_token_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_user_provider.dart';
import 'package:todo_app/modules/auth/domain/interfaces/i_log_in_repository.dart';
import 'package:todo_app/modules/auth/domain/interfaces/i_sign_up_repository.dart';
import 'package:todo_app/modules/categories/data/interfaces/i_category_provider.dart';
import 'package:todo_app/modules/categories/domain/interfaces/i_category_repository.dart';
import 'package:todo_app/modules/tasks/data/interfaces/i_task_provider.dart';
import 'package:todo_app/modules/tasks/domain/interfaces/i_task_repository.dart';

@GenerateMocks([
  // AUTH
  ITokenProvider,
  ILogInProvider,
  ISignUpProvider,
  ILogInRepository,
  ISignUpRepository,

  // USER
  IUserProvider,

  // CATEGORIES
  ICategoryProvider,
  ICategoryRepository,

  // TASKS
  ITaskProvider,
  ITaskRepository,

  // HTTP CLIENT
  Dio,
])
void main() {}
