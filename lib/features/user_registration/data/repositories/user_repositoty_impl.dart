import 'package:dartz/dartz.dart';
import 'package:serotonina/core/error/exceptions.dart';
import 'package:serotonina/core/error/failures.dart';
import 'package:serotonina/features/user_registration/data/datasources/user_datasource.dart';
import 'package:serotonina/features/user_registration/domain/entities/User.dart';
import 'package:serotonina/features/user_registration/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.remoteDataSource});

  final UserDataSource remoteDataSource;

  @override
  Future<Either<Failure, User>> submitNewUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      return Right(await remoteDataSource.submitNewUser(
          username: username, email: email, password: password));
    } on ServerException {
      return Left(ServerFailure());
    } on UserAlreadyExistsException {
      return Left(UserAlreadyExistsFailure());
    }
  }
}
