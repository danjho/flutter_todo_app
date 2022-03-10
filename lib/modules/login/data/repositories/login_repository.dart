import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/login/data/data_sources/i_datasource.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:todo_app/core/errors/errors.dart';

class LoginRepository extends ILoginRepository {
  LoginRepository({required this.datasource});

  final ILoginDatasource datasource;

  @override
  Future<Either<Failure, User>> loginWithEmail(String email, String pwd) async {
    try {
      final user = await datasource.loginWithEmail(email, pwd);
      return Right(user);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
