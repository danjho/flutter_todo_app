import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/extensions/dio_ext.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_log_in_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_token_provider.dart';
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';
import 'package:todo_app/modules/auth/domain/interfaces/i_log_in_repository.dart';

class LogInRepository extends ILogInRepository {
  LogInRepository({required this.logInProvider, required this.tokenProvider});

  final ILogInProvider logInProvider;
  final ITokenProvider tokenProvider;

  @override
  Future<Either<Failure, User>> logInWithEmail(LogInDto dto) async {
    try {
      final user = await logInProvider.logInWithEmail(dto);

      tokenProvider.setToken(user.token ?? '');
      Get.find<Dio>().updateInterceptors(user.token);

      return Right(user);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
