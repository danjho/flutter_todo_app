import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/modules/signup/data/data_sources/i_signup_data_source.dart';
import 'package:todo_app/modules/signup/domain/repositories/i_signup_repository.dart';
import 'package:todo_app/modules/signup/domain/use_cases/signup_with_email.dart';

class SignupWithEmailRepository extends ISignupRepository {
  SignupWithEmailRepository({required this.dataSource});

  final ISignupDataSource dataSource;
  @override
  Future<Either<Failure, User>> signupWithEmail(Params params) async {
    try {
      final loggedUser = await dataSource.signupWithEmail(params);
      return Right(loggedUser);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
