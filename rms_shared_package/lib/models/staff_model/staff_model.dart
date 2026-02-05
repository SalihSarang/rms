import 'package:rms_shared_package/enums/enums.dart';

class StaffModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final UserRole role;
  final String avatar;
  final bool isActive;

  StaffModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.avatar,
    required this.role,
    this.isActive = true,
  });

  factory StaffModel.fromMap(Map<String, dynamic> data, String documentId) {
    return StaffModel(
      id: documentId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      avatar: data['avatar'] ?? '',
      isActive: data['isActive'] ?? true,
      role: UserRole.values.firstWhere(
        (e) => e.name == data['role'],
        orElse: () => UserRole.waiter,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatar': avatar,
      'role': role.name,
      'isActive': isActive,
    };
  }
}
