import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/interfaces/auth/i_sign_in_provider.dart';
import 'package:todo_app/app/data/interfaces/auth/i_token_provider.dart';
import 'package:todo_app/app/data/interfaces/auth/i_user_provider.dart';
import 'package:todo_app/app/domain/dtos/auth/sign_in_dto.dart';
import 'package:todo_app/app/domain/entities/user.dart';
import 'package:todo_app/app/domain/interfaces/i_sign_in_repository.dart';
import 'package:todo_app/app_globals.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/core/extensions/dio_ext.dart';

class SignInRepository extends ISignInRepository {
  SignInRepository({
    required this.signInProvider,
    required this.tokenProvider,
    required this.userProvider,
  });

  final ISignInProvider signInProvider;
  final ITokenProvider tokenProvider;
  final IUserProvider userProvider;

  @override
  Future<Either<Failure, User>> signInWithEmail(SignInDto dto) async {
    try {
      final user = await signInProvider.signInWithEmail(dto);

      AppGlobals.token = user.token;
      AppGlobals.user = user;

      tokenProvider.setToken(user.token);
      userProvider.setUser(json.encode(user.toJson()));
      Get.find<Dio>().updateInterceptors(user.token);

      return Right(user);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
