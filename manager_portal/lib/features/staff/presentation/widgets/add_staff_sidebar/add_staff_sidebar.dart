import 'package:flutter/material.dart';
import 'package:manager_portal/core/widgets/primary_add_button.dart';
import 'package:manager_portal/features/staff/presentation/widgets/add_staff_sidebar/components/dialog_avatar.dart';
import 'package:manager_portal/features/staff/presentation/widgets/add_staff_sidebar/components/dialog_form.dart';
import 'package:manager_portal/features/staff/presentation/widgets/add_staff_sidebar/components/dialog_header.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class AddStaffSidebar extends StatefulWidget {
  const AddStaffSidebar({super.key});

  @override
  State<AddStaffSidebar> createState() => _AddStaffSidebarState();
}

class _AddStaffSidebarState extends State<AddStaffSidebar> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: NeutralColors.background,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            // Header
            DialogHeader(
              title: 'Add New User',
              subtitle: 'Create a new staff account',
            ),

            const Divider(height: 1, color: NeutralColors.border),

            // Body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Avatar
                      AddUserAvatar(initials: 'UN', onTap: () {}, image: null),

                      const SizedBox(height: 12),
                      const Text(
                        'New User',
                        style: TextStyle(
                          color: TextColors.inverse,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Fields
                      AddStaffDialogFields(formKey: _formKey),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(height: 1, color: NeutralColors.border),

            // Footer
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: TextColors.secondary.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  PrimaryAddButton(
                    height: 40,
                    onPressed: () {
                      // Implement save logic
                    },
                    label: 'Save New Staff',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
