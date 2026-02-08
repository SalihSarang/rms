import 'package:rms_shared_package/models/manager_model/manager_model.dart';

// Manager Repository Interface
abstract class ManagerAuthRepository {
  Future<ManagerModel?> signIn(String email, String password);
  Future<void> signOut();
  Future<ManagerModel?> getCurrentManager();
}
