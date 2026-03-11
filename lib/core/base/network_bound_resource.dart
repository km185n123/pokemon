import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/base/cache_handler.dart';
import '../error/failure.dart';

class NetworkBoundResource implements CacheHandler {
  @override
  Future<Either<Failure, T>> run<T>({
    required Future<Either<Failure, T>> Function() remote,
    required Future<void> Function(T data) saveCache,
    required Future<T?> Function() readCache,
    bool returnCacheOnError = true,
    bool skipCache = false,
  }) async {
    final result = await remote();

    return result.fold(
      (failure) async {
        if (returnCacheOnError && !skipCache) {
          final cached = await readCache();
          if (cached != null) return Right(cached);
        }
        return Left(failure);
      },
      (data) async {
        if (!skipCache) {
          await saveCache(data);
        }
        return Right(data);
      },
    );
  }
}
