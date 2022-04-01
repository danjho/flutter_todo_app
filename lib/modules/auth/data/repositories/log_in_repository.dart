import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_globals.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/extensions/dio_ext.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_log_in_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_token_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_user_provider.dart';
import 'package:todo_app/modules/auth/domain/dtos/log_in_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';
import 'package:todo_app/modules/auth/domain/interfaces/i_log_in_repository.dart';

class LogInRepository extends ILogInRepository {
  LogInRepository({
    required this.logInProvider,
    required this.tokenProvider,
    required this.userProvider,
  });

  final ILogInProvider logInProvider;
  final ITokenProvider tokenProvider;
  final IUserProvider userProvider;

  @override
  Future<Either<Failure, User>> logInWithEmail(LogInDto dto) async {
    try {
      final user = await logInProvider.logInWithEmail(dto);

      AppGlobals.token = user.token;
      AppGlobals.user = user;

      tokenProvider.setToken(user.token ?? '');
      userProvider.setUser(user.toJson());
      Get.find<Dio>().updateInterceptors(user.token);

      return Right(user);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
