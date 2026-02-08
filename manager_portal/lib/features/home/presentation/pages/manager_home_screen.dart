import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:manager_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:manager_portal/features/auth/presentation/pages/login_screen.dart';
import 'package:rms_shared_package/models/manager_model/manager_model.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';

class ManagerHomeScreen extends StatelessWidget {
  final ManagerModel manager;

  const ManagerHomeScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
        if (state is LogoutFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogOutSubmitted());
              },
              icon: Icon(Icons.logout),
            ),
          ],
          title: const Text('Manager Dashboard'),
          backgroundColor: PrimaryColors.defaultColor,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, ${manager.name}!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: TextColors.inverse,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                manager.email,
                style: const TextStyle(
                  fontSize: 16,
                  color: TextColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
