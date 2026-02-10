import 'package:flutter/material.dart';
import 'package:manager_portal/features/staff/presentation/utils/sidebar_utils.dart';
import 'package:manager_portal/features/staff/presentation/widgets/activity_container/activity_container.dart';
import 'package:manager_portal/features/staff/presentation/widgets/appbar/appbar.dart';
import 'package:manager_portal/features/staff/presentation/widgets/search_bar_container/search_bar_container.dart';
import 'package:manager_portal/features/staff/presentation/widgets/staff_list_container/staff_list_container.dart';

class StaffListingScreen extends StatelessWidget {
  const StaffListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaffManagementAppbar(
        onAddPressed: () {
          showAddStaffSidebar(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 90, right: 90),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SearchBarContainer(),
                  const SizedBox(height: 20),
                  const StaffListContainer(),
                ],
              ),
              const SizedBox(width: 20),
              ActivityContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
