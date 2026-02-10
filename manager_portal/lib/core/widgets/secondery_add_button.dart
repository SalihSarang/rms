import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';

class SeconderyAddButton extends StatelessWidget {
  final VoidCallback onAddPressed;
  const SeconderyAddButton({super.key, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PrimaryColors.defaultColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onAddPressed,
        tooltip: 'Add New employ',
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
