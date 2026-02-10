import 'package:flutter/material.dart';
import 'package:manager_portal/core/widgets/primary_add_button.dart';
import 'package:manager_portal/core/widgets/secondery_add_button.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class StaffManagementAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onAddPressed;

  const StaffManagementAppbar({super.key, required this.onAddPressed});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isCompact = width <= 1100;
    final bool isIconOnly = width < 900;

    final double titleSize = isCompact ? 18 : 20;
    final double subtitleSize = isCompact ? 12 : 14;
    final double buttonHeight = isCompact ? 40 : 44;
    final double buttonWidth = isIconOnly ? 44 : (isCompact ? 150 : 180);

    final double sideSpacing = isCompact ? 10 : 90;

    return AppBar(
      toolbarHeight: 100,
      titleSpacing: sideSpacing,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Staff Management', style: TextStyle(fontSize: titleSize)),
          const SizedBox(height: 2),
          Text(
            'Manage restaurant staff access, roles, and permissions.',
            style: TextStyle(
              fontSize: subtitleSize,
              color: TextColors.secondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: sideSpacing),
          child: SizedBox(
            height: buttonHeight,
            width: buttonWidth,
            child: isIconOnly
                ? SeconderyAddButton(onAddPressed: () {})
                : PrimaryAddButton(
                    icon: Icons.add,
                    label: 'Add New Staff',
                    height: buttonHeight,
                    width: buttonWidth,
                    onPressed: onAddPressed,
                  ),
          ),
        ),
      ],
    );
  }
}
