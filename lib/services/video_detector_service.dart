import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class VideoDetectorService {
  Future<Map<String, dynamic>> detect(File file) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}/detect/video');

    final req = http.MultipartRequest('POST', uri);
    req.files.add(await http.MultipartFile.fromPath('file', file.path));

    final streamed = await req.send().timeout(const Duration(minutes: 3));
    final res = await http.Response.fromStream(streamed);

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    }
    throw Exception('Video detect failed: ${res.statusCode} ${res.body}');
  }
}