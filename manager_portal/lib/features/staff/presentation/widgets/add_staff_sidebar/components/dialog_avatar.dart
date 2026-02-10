import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class AddUserAvatar extends StatelessWidget {
  final String initials;
  final double size;
  final VoidCallback? onTap;
  final ImageProvider? image;

  const AddUserAvatar({
    super.key,
    required this.initials,
    this.size = 80,
    this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: .none,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: NeutralColors.surface,
                border: Border.all(color: NeutralColors.border),
                image: image != null
                    ? DecorationImage(image: image!, fit: BoxFit.cover)
                    : null,
              ),

              child: image == null
                  ? Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: NeutralColors.surface,
                        shape: BoxShape.circle,
                        border: Border.all(color: NeutralColors.border),
                      ),
                      child: Center(
                        child: Text(
                          initials,
                          style: TextStyle(
                            color: TextColors.inverse.withValues(alpha: 0.7),
                            fontSize: size * 0.3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : null,
            ),

            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(size * 0.05),
                decoration: const BoxDecoration(
                  color: PrimaryColors.defaultColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: size * 0.18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
