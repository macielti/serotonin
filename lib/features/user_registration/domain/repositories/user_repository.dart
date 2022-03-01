import 'package:dartz/dartz.dart';
import 'package:serotonina/core/error/failures.dart';
import 'package:serotonina/features/user_registration/domain/entities/User.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> submitNewUser({
    required String username,
    required String email,
    required String password,
  });
}
