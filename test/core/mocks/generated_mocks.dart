import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app/app/data/interfaces/auth/i_sign_in_provider.dart';
import 'package:todo_app/app/data/interfaces/auth/i_sign_up_provider.dart';
import 'package:todo_app/app/data/interfaces/auth/i_token_provider.dart';
import 'package:todo_app/app/data/interfaces/auth/i_user_provider.dart';
import 'package:todo_app/app/data/interfaces/categories/i_category_provider.dart';
import 'package:todo_app/app/data/interfaces/tasks/i_task_provider.dart';
import 'package:todo_app/app/domain/interfaces/i_category_repository.dart';
import 'package:todo_app/app/domain/interfaces/i_sign_in_repository.dart';
import 'package:todo_app/app/domain/interfaces/i_sign_up_repository.dart';
import 'package:todo_app/app/domain/interfaces/i_task_repository.dart';

@GenerateMocks([
  // AUTH
  ITokenProvider,
  ISignInProvider,
  ISignUpProvider,
  ISignInRepository,
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
