import 'package:manager_portal/features/auth/domain/repositories/auth_repository.dart';

//Sign-Out Namager Usecase
class SignOutManager {
  final ManagerAuthRepository repository;

  SignOutManager(this.repository);
  Future<void> call() => repository.signOut();
}
