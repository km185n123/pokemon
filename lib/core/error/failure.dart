import 'package:equatable/equatable.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class CacheFailure extends Failure with EquatableMixin {
  const CacheFailure(super.message);

  @override
  List<Object?> get props => [message];
}
