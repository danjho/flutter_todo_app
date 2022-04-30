import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/interfaces/auth/i_sign_up_provider.dart';
import 'package:todo_app/app/data/interfaces/auth/i_token_provider.dart';
import 'package:todo_app/app/data/interfaces/auth/i_user_provider.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_up_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/app/domain/interfaces/i_sign_up_repository.dart';
import 'package:todo_app/app_globals.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/extensions/dio_ext.dart';

class SignUpRepository extends ISignUpRepository {
  SignUpRepository({
    required this.signUpProvider,
    required this.tokenProvider,
    required this.userProvider,
  });

  final ISignUpProvider signUpProvider;
  final ITokenProvider tokenProvider;
  final IUserProvider userProvider;

  @override
  Future<Either<Failure, User>> signUpWithEmail(SignUpDto dto) async {
    try {
      final loggedUser = await signUpProvider.signUpWithEmail(dto);

      AppGlobals.token = loggedUser.token;
      AppGlobals.user = loggedUser;

      tokenProvider.setToken(loggedUser.token);
      userProvider.setUser(json.encode(loggedUser.toJson()));
      Get.find<Dio>().updateInterceptors(loggedUser.token);

      return Right(loggedUser);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
