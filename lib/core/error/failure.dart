import 'package:equatable/equatable.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure with EquatableMixin {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class ConnectionFailure extends Failure with EquatableMixin {
  const ConnectionFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure with EquatableMixin {
  const CacheFailure(super.message);

  @override
  List<Object?> get props => [message];
}
