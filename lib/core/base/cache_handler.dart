import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';

abstract class CacheHandler {
  Future<Either<Failure, T>> run<T>({
    required Future<Either<Failure, T>> Function() remote,
    required Future<void> Function(T data) saveCache,
    required Future<T?> Function() readCache,
    bool returnCacheOnError = true,
    bool skipCache = false,
  });
}
