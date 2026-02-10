import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class PrimaryAddButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  // Optional controls
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final IconData? icon;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;

  const PrimaryAddButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8,
    this.icon,
    this.iconSize = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? PrimaryColors.defaultColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: iconSize,
                color: textColor ?? TextColors.inverse,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: textColor ?? TextColors.inverse,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
