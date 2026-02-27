import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import '../config/api_config.dart';

class ImageDetectorService {
  Future<Map<String, dynamic>> detect(File file) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}/detect/image');

    final mimeType = lookupMimeType(file.path) ?? 'image/jpeg';
    final parts = mimeType.split('/');
    final mediaType = MediaType(parts[0], parts.length > 1 ? parts[1] : 'jpeg');

    final req = http.MultipartRequest('POST', uri);
    req.files.add(
      await http.MultipartFile.fromPath(
        'file',
        file.path,
        contentType: mediaType, // ✅ force "image/*"
      ),
    );

    final streamed = await req.send().timeout(const Duration(seconds: 60));
    final res = await http.Response.fromStream(streamed);

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    }
    throw Exception('Image detect failed: ${res.statusCode} ${res.body}');
  }
}