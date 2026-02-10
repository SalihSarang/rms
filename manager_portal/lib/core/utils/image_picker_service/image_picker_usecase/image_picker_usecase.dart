import 'dart:io';

import 'package:manager_portal/core/utils/image_picker_service/cloudinary_service/cloudinary_service.dart';
import 'package:manager_portal/core/utils/image_picker_service/image_picker/image_picker.dart';

class ImagePickerUsecase {
  final ImagePickerService imagePicker;
  final CloudinaryService cloudinary;

  ImagePickerUsecase({required this.imagePicker, required this.cloudinary});

  Future<String?> call({required String folder}) async {
    final File? file = await imagePicker.pickImage();

    if (file == null) return null;
    final url = await cloudinary.uploadImage(file: file, folder: folder);
    return url;
  }
}
