part of 'staff_bloc.dart';

sealed class StaffState extends Equatable {
  const StaffState();

  @override
  List<Object?> get props => [];
}

final class StaffInitial extends StaffState {}

class StaffEditingState extends StaffState {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String role;
  final String? avatar;

  const StaffEditingState({
    this.fullName = "",
    this.email = "",
    this.phoneNumber = "",
    this.password = "",
    this.role = "Waiter",
    this.avatar,
  });

  StaffEditingState copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? role,
    String? avatar,
  }) {
    return StaffEditingState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [
    fullName,
    email,
    phoneNumber,
    password,
    role,
    avatar,
  ];
}

class FormSubmitting extends StaffState {}

class StaffFormIsInvalid extends StaffState {
  final String reason;
  const StaffFormIsInvalid(this.reason);
  @override
  List<Object?> get props => [reason];
}

class StaffCreated extends StaffState {}

class StaffCreateFailed extends StaffState {
  final String error;
  const StaffCreateFailed(this.error);
  @override
  List<Object?> get props => [error];
}

class AllStaffs extends StaffState {
  final List<StaffModel> stafs;
  const AllStaffs(this.stafs);
  @override
  List<Object?> get props => [stafs];
}

class StaffDetails extends StaffState {
  final StaffModel staff;
  const StaffDetails(this.staff);
  @override
  List<Object?> get props => [staff];
}
