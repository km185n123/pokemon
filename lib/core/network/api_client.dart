import 'package:pokemon/core/network/clienthttp/http_engine.dart';
import 'requeststrategy/request_strategy.dart';

class ApiClient {
  final HttpEngine engine;

  ApiClient(this.engine);

  Future<T> request<T>(
    RequestStrategy strategy,
    String path,
    T Function(Map<String, dynamic>) parser, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    final json = await strategy.execute(engine, path, query: query, body: body);

    return parser(json);
  }
}
