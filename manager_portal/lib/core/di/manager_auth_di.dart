import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manager_portal/core/di/injector.dart';
import 'package:manager_portal/features/auth/data/datasources/manager_auth_remote_datasource.dart';
import 'package:manager_portal/features/auth/data/repositories/manager_auth_repo_impl.dart';
import 'package:manager_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:manager_portal/features/auth/domain/usecases/check_auth_status.dart';
import 'package:manager_portal/features/auth/domain/usecases/sign_in_manager.dart';
import 'package:manager_portal/features/auth/domain/usecases/sign_out_manager.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_bloc.dart';

//Manager Auth DI
void managerAuthDI() {
  //Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data Sources
  getIt.registerLazySingleton<ManagerAuthRemoteDataSource>(
    () => ManagerAuthRemoteDataSourceImpl(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<ManagerAuthRepository>(
    () => ManagerAuthRepoImpl(
      remoteDataSource: getIt<ManagerAuthRemoteDataSource>(),
    ),
  );

  //Auth Usecases
  getIt.registerLazySingleton(() => SignInManager(getIt()));
  getIt.registerLazySingleton(() => SignOutManager(getIt()));
  getIt.registerLazySingleton(() => CheckAuthStatus(getIt()));

  //Register Bloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(signin: getIt(), signout: getIt(), authStatus: getIt()),
  );
}
