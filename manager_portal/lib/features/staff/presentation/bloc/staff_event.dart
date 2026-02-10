part of 'staff_bloc.dart';

sealed class StaffEvent extends Equatable {
  const StaffEvent();

  @override
  List<Object?> get props => [];
}

class FullNameChanged extends StaffEvent {
  final String fullName;
  const FullNameChanged(this.fullName);
  @override
  List<Object?> get props => [fullName];
}

class EmailChanged extends StaffEvent {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class PhoneNumberChanged extends StaffEvent {
  final String phoneNumber;
  const PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class PasswordChanged extends StaffEvent {
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

class StaffRoleChanged extends StaffEvent {
  final String role;
  const StaffRoleChanged(this.role);
  @override
  List<Object?> get props => [role];
}

class AvatarChanged extends StaffEvent {
  final String image;
  const AvatarChanged(this.image);
  @override
  List<Object?> get props => [image];
}

class SubmitStaffAddForm extends StaffEvent {}
