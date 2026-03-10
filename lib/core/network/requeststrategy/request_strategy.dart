import '../clienthttp/http_engine.dart';

abstract class RequestStrategy {
  Future<Map<String, dynamic>> execute(
    HttpEngine engine,
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  });
}
