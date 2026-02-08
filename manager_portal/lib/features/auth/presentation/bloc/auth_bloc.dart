import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manager_portal/features/auth/domain/usecases/check_auth_status.dart';
import 'package:manager_portal/features/auth/domain/usecases/sign_in_manager.dart';
import 'package:manager_portal/features/auth/domain/usecases/sign_out_manager.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInManager signin;
  final SignOutManager signout;
  final CheckAuthStatus authStatus;

  AuthBloc({
    required this.signin,
    required this.signout,
    required this.authStatus,
  }) : super(const LogInInitialState()) {
    on<LoginSubmitted>(_onSubmitted);
    on<LogOutSubmitted>(_onLogoutSubmitted);
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityChanged>(_onPasswordVisibleChanged);
    on<CheckingAuthStatus>(_onCheckingAuthStatus);

    Future.microtask(() => add(CheckingAuthStatus()));
  }

  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;

  FormEditingState get currentFormState => _currentEditingState();

  FormEditingState _currentEditingState() {
    return FormEditingState(
      email: _email,
      password: _password,
      isPasswordVisible: _isPasswordVisible,
    );
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<AuthState> emit) {
    _email = event.email;
    emit(_currentEditingState());
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<AuthState> emit) {
    _password = event.password;
    emit(_currentEditingState());
  }

  void _onPasswordVisibleChanged(
    LoginPasswordVisibilityChanged event,
    Emitter<AuthState> emit,
  ) {
    _isPasswordVisible = !_isPasswordVisible;
    emit(_currentEditingState());
  }

  Future<void> _onLogoutSubmitted(
    LogOutSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingState());
    try {
      await signout();
      emit(Unauthenticated());
    } catch (e) {
      emit(LogoutFailure('Log-Out Failed: ${e.toString()}'));
    }
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingState());
    try {
      final user = await signin(event.email, event.password);

      if (user == null) {
        emit(LoginFailure('Invalid credentials'));
        return;
      }

      emit(LoginSuccess(user));
      emit(Authenticated(user));
      log('LoginSuccess');
      log('User Name ${user.name}');
      log('User Email ${user.email}');
    } catch (e) {
      emit(LoginFailure("Log-In Failed: ${e.toString()}"));
    }
  }

  void _onCheckingAuthStatus(
    CheckingAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthChecking());
    try {
      final manager = await authStatus();

      if (manager != null) {
        emit(Authenticated(manager));
        log('User Name ${manager.name}');
        log('User Email ${manager.email}');
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(
        StatusCheckingFailure('Auth Status Checking Failed: ${e.toString()}'),
      );
    }
  }
}
