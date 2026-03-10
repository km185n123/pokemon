import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/base/cache_handler.dart';
import '../error/failure.dart';
import '../error/failure_mapper.dart';

class NetworkBoundResource implements CacheHandler {
  @override
  Future<Either<Failure, T>> run<T>({
    required Future<T> Function() remote,
    required Future<void> Function(T data) saveCache,
    required Future<T?> Function() readCache,
  }) async {
    try {
      final result = await remote();
      await saveCache(result);
      return Right(result);
    } catch (error) {
      final cached = await readCache();
      if (cached != null) return Right(cached);
      return Left(FailureMapper.map(error));
    }
  }
}
