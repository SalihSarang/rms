import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manager_portal/core/di/injector.dart';
import 'package:manager_portal/features/auth/data/repositories/manager_auth_repo_impl.dart';
import 'package:manager_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:manager_portal/features/auth/domain/usecases/check_auth_status.dart';
import 'package:manager_portal/features/auth/domain/usecases/sign_in_manager.dart';
import 'package:manager_portal/features/auth/domain/usecases/sign_out_manager.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_bloc.dart';

void managerAuthDI() {
  //Firebase
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  //Register AuthRepository
  getIt.registerLazySingleton<ManagerAuthRepository>(
    () => ManagerAuthRepoImpl(auth: getIt(), firestore: getIt()),
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
