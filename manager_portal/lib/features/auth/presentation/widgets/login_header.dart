import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // Logo Placeholder
        Icon(Icons.dns_outlined, size: 48, color: TextColors.secondary),
        SizedBox(height: 24),

        // Welcome Text
        Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TextColors.inverse,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Sign in to access your management dashboard.',
          textAlign: TextAlign.center,
          style: TextStyle(color: TextColors.secondary, fontSize: 14),
        ),
      ],
    );
  }
}
