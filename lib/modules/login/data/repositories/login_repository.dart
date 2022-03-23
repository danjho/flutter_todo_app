import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/login/data/data_sources/i_datasource.dart';
import 'package:todo_app/modules/login/data/data_sources/i_token_local_data_source.dart';
import 'package:todo_app/modules/login/domain/dtos/login_dto.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:todo_app/core/errors/errors.dart';

class LoginRepository extends ILoginRepository {
  LoginRepository({required this.datasource, required this.localDataSource});

  final ILoginDatasource datasource;
  final ITokenLocalDataSource localDataSource;

  @override
  Future<Either<Failure, User>> loginWithEmail(LoginDto dto) async {
    try {
      final user = await datasource.loginWithEmail(dto);
      return Right(user);
    } catch (e) {
      return Left(DatasourceError());
    }
  }

  @override
  Future<String?> getToken() {
    return localDataSource.getToken();
  }

  @override
  Future<void> setToken(String token) {
    return localDataSource.setToken(token);
  }
}
