import 'dart:io';

import 'package:dio/dio.dart';

abstract class CloudinaryService {
  Future<String> uploadImage({
    required File file,
    required String folder,
    Function(double progress)? onProgress,
  });
}

class CloudinaryServiceImpl implements CloudinaryService {
  final Dio _dio = Dio();

  static const _cloudName = 'defjrqf4l';
  static const _uploadPreset = 'manager_uploads';

  @override
  Future<String> uploadImage({
    required File file,
    required String folder,
    Function(double progress)? onProgress,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
      'upload_preset': _uploadPreset,
      'folder': folder,
    });

    final response = await _dio.post(
      'https://api.cloudinary.com/v1_1/$_cloudName/image/upload',
      data: formData,
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Cloudinary upload failed: ${response.data}");
    }

    return response.data['secure_url'] as String;
  }
}
