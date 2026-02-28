import 'dart:io';
import 'dart:typed_data';

class PickedMedia {
  final File? file; // Android/iOS/Desktop
  final Uint8List? bytes; // Web
  final String name;
  final String mimeType;

  const PickedMedia({
    required this.name,
    required this.mimeType,
    this.file,
    this.bytes,
  });
}