import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';

class RepositoryHandler {
  static Future<Either<Failure, T>> run<T>(Future<T> Function() task) async {
    try {
      final result = await task();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, T>> runCache<T>(
    Future<T> Function() task,
  ) async {
    try {
      final result = await task();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
