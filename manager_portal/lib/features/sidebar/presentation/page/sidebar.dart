import 'package:flutter/material.dart';
import 'package:manager_portal/features/staff/presentation/pages/staff_listing_page.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:manager_portal/features/sidebar/presentation/widgets/manager_sidebar_x.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final PageController _pageController = PageController();
  final SidebarXController _controller = SidebarXController(
    selectedIndex: 0,
    extended: true,
  );
  double? _lastWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.of(context).size.width;
    if (_lastWidth != null) {
      if (width < 600 && _lastWidth! >= 600) {
        _controller.setExtended(false);
      } else if (width >= 600 && _lastWidth! < 600) {
        _controller.setExtended(true);
      }
    } else if (width < 600) {
      _controller.setExtended(false);
    }
    _lastWidth = width;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _pageController.jumpToPage(_controller.selectedIndex);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.selectIndex(0);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ManagerSidebarX(controller: _controller),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Center(child: Text('Overview Page')),
                StaffListingScreen(),
                Center(child: Text('Products Page')),
                Center(child: Text('Reports Page')),
                Center(child: Text('Settings Page')),
                Center(child: Text('Logout Page')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
