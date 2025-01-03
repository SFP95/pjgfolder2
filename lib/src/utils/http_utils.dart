import 'package:http/http.dart' as http;

class ApiClient<T> {
  static const String baseUrl = 'https://pre-api.rolegamesystem.alexdev.es/api/v1';
  static const String apiKey = 'jPWCeIZ5/GGRZgN5jnmMaaGBUS1UZvsyXpbS5wilEK6zMjMqzMHQb7kmM9oHDOzNX+Qyi//dZRkLq20HfYaK+162NvrkkxrjtQL1EexklWiLcLFdgwcQTVcjGVR7ebCkKZQAUW7rd3HJ56iALex1cm7fIena5dsiXFLLRWUIElyzabst4zIAVGjwsreo2X9h+POd0/30NQZVphqrxMv1rQ==';

  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    return await http.get(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(endpoint, headers));
  }

  Future<http.Response> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    print('$baseUrl/$endpoint');
    var response = await http.post(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(endpoint, headers), body: body);
    print(response.statusCode);
    return response;
  }

  Future<http.Response> patch(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    return await http.patch(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(endpoint, headers), body: body);
  }

  Future<http.Response> put(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    return await http.put(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(endpoint, headers), body: body);
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? headers}) async {
    return await http.delete(Uri.parse('$baseUrl/$endpoint'), headers: _buildHeaders(endpoint, headers));
  }

  Map<String, String> _buildHeaders(String endpoint, Map<String, String>? headers) {
    final Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_buildAuthorizationToken(endpoint)}',
      'X-Api-Key': apiKey,
    };

    if (headers != null) {
      defaultHeaders.addAll(headers);
    }

    return defaultHeaders;
  }

  String _buildAuthorizationToken(String endpoint) {
    // Ejemplo: Concatenar el valor de `endpoint` con una cadena fija
    return '$endpoint-authorization-token';
  }
}
