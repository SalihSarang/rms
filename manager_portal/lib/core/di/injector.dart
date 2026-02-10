import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:manager_portal/core/di/image_picker_di.dart';
import 'package:manager_portal/core/di/manager_auth_di.dart';

final getIt = GetIt.instance;

void setupDI() {
  //Firebase
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  //Manager Auth DI
  managerAuthDI();

  // Image Picker and Cloudinary DI
  setUpImagePicker();
}
