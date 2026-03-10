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
  }) async {
    final result = await remote();

    return result.fold(
      (failure) async {
        if (returnCacheOnError) {
          final cached = await readCache();
          if (cached != null) return Right(cached);
        }
        return Left(failure);
      },
      (data) async {
        await saveCache(data);
        return Right(data);
      },
    );
  }
}
