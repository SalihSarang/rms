import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends AuthEvent {
  final String email;
  const LoginEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends AuthEvent {
  final String password;
  const LoginPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoginPasswordVisibilityChanged extends AuthEvent {
  const LoginPasswordVisibilityChanged();
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;
  const LoginSubmitted(this.email, this.password);
}

class LogOutSubmitted extends AuthEvent {
  const LogOutSubmitted();
}

class CheckingAuthStatus extends AuthEvent {
  const CheckingAuthStatus();
}
