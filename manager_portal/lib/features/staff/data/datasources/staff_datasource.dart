import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';

abstract class StaffDatasource {
  Future<List<StaffModel?>> getAllStaffs();
  Future<StaffModel> getStaffDetails();
  Future<void> addNewStaff();
  Future<void> createNewUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class StaffDatasourceImpl implements StaffDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const StaffDatasourceImpl({required this.auth, required this.firestore});

  @override
  Future<void> addNewStaff() {
    throw UnimplementedError();
  }

  @override
  Future<void> createNewUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<StaffModel?>> getAllStaffs() {
    throw UnimplementedError();
  }

  @override
  Future<StaffModel> getStaffDetails() {
    throw UnimplementedError();
  }
}
