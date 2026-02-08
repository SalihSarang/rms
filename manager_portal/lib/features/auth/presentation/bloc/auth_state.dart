import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/models/manager_model/manager_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class LogInInitialState extends AuthState {
  const LogInInitialState();
  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FormEditingState extends AuthState {
  final String email;
  final String password;
  final bool isPasswordVisible;
  const FormEditingState({
    required this.email,
    required this.password,
    required this.isPasswordVisible,
  });
  @override
  List<Object?> get props => [email, password, isPasswordVisible];
}

class LoginSuccess extends AuthState {
  final ManagerModel manager;
  const LoginSuccess(this.manager);
  @override
  List<Object?> get props => [manager];
}

class LoginFailure extends AuthState {
  final String error;
  const LoginFailure(this.error);
  @override
  List<Object?> get props => [error];
}

class LogoutFailure extends AuthState {
  final String error;
  const LogoutFailure(this.error);
  @override
  List<Object?> get props => [error];
}

class AuthChecking extends AuthState {
  const AuthChecking();
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final ManagerModel manager;
  const Authenticated(this.manager);
  @override
  List<Object?> get props => [manager];
}

class Unauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class StatusCheckingFailure extends AuthState {
  final String error;
  const StatusCheckingFailure(this.error);
  @override
  List<Object?> get props => [error];
}
