import 'package:manager_portal/features/auth/data/datasources/manager_auth_remote_datasource.dart';
import 'package:manager_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:rms_shared_package/models/manager_model/manager_model.dart';

class ManagerAuthRepoImpl implements ManagerAuthRepository {
  final ManagerAuthRemoteDataSource remoteDataSource;

  ManagerAuthRepoImpl({required this.remoteDataSource});

  // Sign-in Manager
  @override
  Future<ManagerModel?> signIn(String email, String password) async {
    return await remoteDataSource.signIn(email, password);
  }

  // Sign-out Manager
  @override
  Future<void> signOut() async => await remoteDataSource.signOut();

  //Checking Auth status
  @override
  Future<ManagerModel?> getCurrentManager() async {
    return await remoteDataSource.getCurrentManager();
  }
}
