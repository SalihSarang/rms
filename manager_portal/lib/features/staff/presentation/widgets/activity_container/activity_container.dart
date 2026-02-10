import 'package:flutter/material.dart';
import 'package:manager_portal/features/staff/presentation/widgets/stats_card/stats_card.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/semantic_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 500,
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: NeutralColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 20),
            child: Text(
              'Activity',
              style: TextStyle(color: TextColors.inverse),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: NeutralColors.border,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: NeutralColors.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: NeutralColors.border),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: StatsCard(
              dotColor: PrimaryColors.lightColor,
              title: 'Total Stafs',
              value: '20',
              onTap: () {},
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: StatsCard(
              dotColor: SemanticColors.info,
              title: 'Active',
              value: '15',
              onTap: () {},
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: StatsCard(
              dotColor: SemanticColors.error,
              title: 'Not Active',
              value: '5',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
