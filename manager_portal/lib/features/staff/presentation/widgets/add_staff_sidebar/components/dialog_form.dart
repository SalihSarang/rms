import 'package:flutter/material.dart';
import 'package:manager_portal/features/staff/presentation/widgets/add_staff_sidebar/components/dialog_fields.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class AddStaffDialogFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AddStaffDialogFields({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabeledTextField(label: 'Full Name', hint: 'e.g. Sarah Jenkins'),
        const SizedBox(height: 20),

        const LabeledTextField(
          label: 'Email Address',
          hint: 'e.g. sarah.j@bistro.com',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),

        const LabeledTextField(
          label: 'Phone Number',
          hint: '+1 (555) 000-1234',
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 20),

        const LabeledTextField(
          label: 'Password',
          hint: 'Enter password for staff',
          obscureText: true,
        ),
        const SizedBox(height: 20),

        // Role dropdown
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Role & Permissions',
              style: TextStyle(
                color: TextColors.secondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: 'Waiter',
              style: const TextStyle(color: TextColors.inverse),
              dropdownColor: NeutralColors.surface,
              items: const ['Waiter', 'Chef', 'Manager']
                  .map(
                    (role) => DropdownMenuItem(value: role, child: Text(role)),
                  )
                  .toList(),
              onChanged: (_) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: NeutralColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: NeutralColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: PrimaryColors.defaultColor,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: TextColors.secondary,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),
        Text(
          'Access to POS, table management, and order entry.',
          style: TextStyle(
            color: TextColors.secondary.withValues(alpha: 0.5),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
