import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:serotonina/core/error/failures.dart';
import 'package:serotonina/core/usecases/usecase.dart';
import 'package:serotonina/features/user_registration/domain/entities/User.dart';
import 'package:serotonina/features/user_registration/domain/repositories/user_repository.dart';

class SubmitNewUser implements UseCase<User, Params> {
  SubmitNewUser(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await userRepository.submitNewUser(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  Params({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;

  @override
  List<Object?> get props => [username, email, password];
}
