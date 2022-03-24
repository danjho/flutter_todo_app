import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/extensions/dio_ext.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_sign_up_provider.dart';
import 'package:todo_app/modules/auth/data/interfaces/i_token_provider.dart';
import 'package:todo_app/modules/auth/domain/dtos/create_user_dto.dart';
import 'package:todo_app/modules/auth/domain/entities/user.dart';
import 'package:todo_app/modules/auth/domain/interfaces/i_sign_up_repository.dart';

class SignUpWithEmailRepository extends ISignUpRepository {
  SignUpWithEmailRepository({
    required this.signUpProvider,
    required this.tokenProvider,
  });

  final ISignUpProvider signUpProvider;
  final ITokenProvider tokenProvider;
  @override
  Future<Either<Failure, User>> signUpWithEmail(CreateUserDto dto) async {
    try {
      final loggedUser = await signUpProvider.signUpWithEmail(dto);

      tokenProvider.setToken(loggedUser.token ?? '');
      Get.find<Dio>().updateInterceptors(loggedUser.token);

      return Right(loggedUser);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
