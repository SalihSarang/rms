import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class StaffListContainer extends StatelessWidget {
  const StaffListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1150,
      height: 400,
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: NeutralColors.border),
      ),
    );
  }
}
