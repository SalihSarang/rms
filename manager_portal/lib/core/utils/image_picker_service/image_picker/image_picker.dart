import 'dart:io';

import 'package:file_picker/file_picker.dart';

abstract class ImagePickerService {
  Future<File?> pickImage();
}

class ImagePickerImpl implements ImagePickerService {
  @override
  Future<File?> pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null || result.files.single.path == null) return null;
    return File(result.files.single.path!);
  }
}
