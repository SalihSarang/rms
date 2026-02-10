import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class DialogHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onClose;

  const DialogHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: TextColors.inverse,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: TextColors.secondary.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onClose ?? () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, color: TextColors.secondary),
          ),
        ],
      ),
    );
  }
}
