import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/errors.dart';
import 'package:todo_app/modules/login/domain/entities/user.dart';
import 'package:todo_app/modules/sign_up/data/data_sources/i_sign_up_data_source.dart';
import 'package:todo_app/modules/sign_up/domain/dtos/sign_up_dto.dart';
import 'package:todo_app/modules/sign_up/domain/repositories/i_sign_up_repository.dart';

class SignUpWithEmailRepository extends ISignUpRepository {
  SignUpWithEmailRepository({required this.dataSource});

  final ISignUpDataSource dataSource;
  @override
  Future<Either<Failure, User>> signUpWithEmail(SignUpDto dto) async {
    try {
      final loggedUser = await dataSource.signUpWithEmail(dto);
      return Right(loggedUser);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
