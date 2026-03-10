import 'package:fpdart/fpdart.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/error/failure_mapper.dart';
import 'package:pokemon/core/network/clienthttp/http_engine.dart';
import 'requeststrategy/request_strategy.dart';

class ApiClient {
  final HttpEngine engine;

  ApiClient(this.engine);

  Future<Either<Failure, T>> request<T>(
    RequestStrategy strategy,
    String path,
    T Function(Map<String, dynamic>) parser, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    try {
      final json = await strategy.execute(
        engine,
        path,
        query: query,
        body: body,
      );
      return Right(parser(json));
    } catch (error) {
      return Left(FailureMapper.map(error));
    }
  }
}
