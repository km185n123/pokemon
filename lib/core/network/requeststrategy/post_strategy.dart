import '../clienthttp/http_engine.dart';
import 'request_strategy.dart';

class PostStrategy implements RequestStrategy {
  @override
  Future<Map<String, dynamic>> execute(
    HttpEngine engine,
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    return engine.post(path, body: body);
  }
}
