import 'package:flutter/material.dart';
import 'package:manager_portal/features/staff/presentation/widgets/add_staff_sidebar/add_staff_sidebar.dart';

void showAddStaffSidebar(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const Align(
        alignment: Alignment.centerRight,
        child: AddStaffSidebar(),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );
    },
  );
}
