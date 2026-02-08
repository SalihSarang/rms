import 'package:manager_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:rms_shared_package/models/manager_model/manager_model.dart';

// Sign-in Manager Usercase
class SignInManager {
  final ManagerAuthRepository repository;

  SignInManager(this.repository);

  Future<ManagerModel?> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
