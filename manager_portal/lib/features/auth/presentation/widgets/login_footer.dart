import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class LoginFooter extends StatelessWidget {
  final VoidCallback onHelpTap;

  const LoginFooter({super.key, required this.onHelpTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onHelpTap,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.help_outline, size: 14, color: TextColors.secondary),
              SizedBox(width: 4),
              Text(
                'Need Help?',
                style: TextStyle(color: TextColors.secondary, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
