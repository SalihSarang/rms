import 'package:manager_portal/core/di/injector.dart';
import 'package:manager_portal/core/utils/image_picker_service/cloudinary_service/cloudinary_service.dart';
import 'package:manager_portal/core/utils/image_picker_service/feature_specific_usecase/food_img_picker.dart';
import 'package:manager_portal/core/utils/image_picker_service/feature_specific_usecase/staff_profile_img_picker.dart';
import 'package:manager_portal/core/utils/image_picker_service/image_picker/image_picker.dart';
import 'package:manager_portal/core/utils/image_picker_service/image_picker_usecase/image_picker_usecase.dart';

// Image Picker and Cloudinary DI
// PickImage for Staff Profile image and food image (for menue)

void setUpImagePicker() {
  // Image picker
  getIt.registerLazySingleton<ImagePickerService>(() => ImagePickerImpl());

  // Cloudinary
  getIt.registerLazySingleton<CloudinaryService>(() => CloudinaryServiceImpl());

  // Image Picker Usecase
  getIt.registerFactory(
    () => ImagePickerUsecase(imagePicker: getIt(), cloudinary: getIt()),
  );

  // Staff profile picker usecase
  getIt.registerFactory(() => StaffProfileImgPicker(base: getIt()));
  //Food menue image picker usecase
  getIt.registerFactory(() => FoodImgPickerUsecase(base: getIt()));
}
