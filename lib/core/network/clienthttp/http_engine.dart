abstract class HttpEngine {
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query});

  Future<Map<String, dynamic>> post(String path, {Map<String, dynamic>? body});
}
