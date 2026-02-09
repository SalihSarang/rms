import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class ManagerSidebarTheme {
  static SidebarXTheme get mainTheme => SidebarXTheme(
    margin: const EdgeInsets.all(0),
    decoration: const BoxDecoration(color: NeutralColors.background),
    textStyle: const TextStyle(color: TextColors.secondary),
    selectedTextStyle: const TextStyle(color: PrimaryColors.defaultColor),
    itemTextPadding: const EdgeInsets.only(left: 10),
    selectedItemTextPadding: const EdgeInsets.only(left: 10),
    itemMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    selectedItemMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    itemPadding: const EdgeInsets.all(10),
    selectedItemPadding: const EdgeInsets.all(10),
    itemDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    selectedItemDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: PrimaryColors.defaultColor.withValues(alpha: 0.1),
      border: Border.all(
        color: PrimaryColors.hoverColor.withValues(alpha: 0.3),
      ),
    ),
    iconTheme: const IconThemeData(color: TextColors.secondary, size: 24),
    selectedIconTheme: const IconThemeData(
      color: PrimaryColors.defaultColor,
      size: 24,
    ),
    hoverColor: PrimaryColors.defaultColor.withValues(alpha: 0.1),
    hoverIconTheme: const IconThemeData(color: PrimaryColors.defaultColor),
    hoverTextStyle: const TextStyle(color: PrimaryColors.defaultColor),
  );

  static SidebarXTheme get extendedTheme => const SidebarXTheme(
    width: 250,
    decoration: BoxDecoration(color: NeutralColors.background),
  );
}
