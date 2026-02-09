import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manager_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:rms_shared_package/constants/db_constants.dart';
import 'package:rms_shared_package/models/manager_model/manager_model.dart';

class ManagerAuthRepoImpl implements ManagerAuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  ManagerAuthRepoImpl({required this.auth, required this.firestore});

  // Sign-in Manager
  @override
  Future<ManagerModel?> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      return getCurrentManager();
    } catch (e) {
      rethrow;
    }
  }

  // Sign-out Manager
  @override
  Future<void> signOut() async => await auth.signOut();

  //Checking Auth status
  @override
  Future<ManagerModel?> getCurrentManager() async {
    final user = auth.currentUser;

    if (user == null) return null;
    final docSnapshot = await firestore
        .collection(ManagerDbConstants.manager)
        .doc(user.uid)
        .get();

    if (!docSnapshot.exists || docSnapshot.data() == null) return null;

    return ManagerModel.fromJson(docSnapshot.data()!);
  }
}
