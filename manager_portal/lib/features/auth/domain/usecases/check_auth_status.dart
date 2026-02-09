import 'package:manager_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:rms_shared_package/models/manager_model/manager_model.dart';

class CheckAuthStatus {
  final ManagerAuthRepository repo;
  CheckAuthStatus(this.repo);

  Future<ManagerModel?> call() => repo.getCurrentManager();
}
