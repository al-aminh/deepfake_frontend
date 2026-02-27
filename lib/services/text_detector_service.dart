import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class TextDetectorService {
  Future<Map<String, dynamic>> detect(String text) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}/detect/text');

    final res = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'text': text}),
        )
        .timeout(const Duration(seconds: 30));

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    }
    throw Exception('Text detect failed: ${res.statusCode} ${res.body}');
  }
}