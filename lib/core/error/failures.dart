import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({this.properties = const <dynamic>[]});

  final List properties;

  @override
  List<Object?> get props => [properties];
}

//General Failures
class ServerFailure extends Failure {}

class UserAlreadyExistsFailure extends Failure {}
