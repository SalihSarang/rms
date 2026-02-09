import 'package:flutter/material.dart';
import 'package:manager_portal/features/auth/presentation/widgets/login_body.dart';
import 'package:manager_portal/features/auth/presentation/widgets/login_footer.dart';
import 'package:manager_portal/features/auth/presentation/widgets/login_header.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF161B22),
              NeutralColors.background,
              NeutralColors.background,
              NeutralColors.background,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                color: NeutralColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: NeutralColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoginHeader(),
                  const SizedBox(height: 32),
                  const LoginBody(),
                  const SizedBox(height: 32),
                  LoginFooter(
                    onHelpTap: () {
                      //  Implement help functionality
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
