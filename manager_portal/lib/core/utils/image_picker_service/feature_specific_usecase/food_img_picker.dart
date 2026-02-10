import 'package:manager_portal/core/utils/image_picker_service/image_picker_usecase/image_picker_usecase.dart';

class FoodImgPickerUsecase {
  final ImagePickerUsecase base;

  FoodImgPickerUsecase({required this.base});

  Future<String?> call() {
    return base(folder: 'food_images');
  }
}
