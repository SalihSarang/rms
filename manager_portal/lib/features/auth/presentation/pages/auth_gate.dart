import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:manager_portal/features/auth/presentation/pages/login_screen.dart';
import 'package:manager_portal/features/sidebar/presentation/page/sidebar.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          log('User Name ${state.manager.name}');
          return const Sidebar();
        }

        if (state is StatusCheckingFailure) {
          return Scaffold(body: Center(child: Text(state.error)));
        }

        if (state is AuthChecking || state is LogInInitialState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return const LoginScreen();
      },
    );
  }
}
