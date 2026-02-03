import 'package:flutter/material.dart';
import 'package:app_store/core/style/color/colors_dark.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:app_store/core/common/widgets/admin_app_bar.dart';
import 'package:app_store/features/admin/dashboard/presentation/screens/dash_board_screen.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return const MenuAdminScreen();
        },
      ),
      mainScreen: DashBoardScreen(),
      borderRadius: 24.0,
      showShadow: true,
      drawerShadowsBackgroundColor: ColorsDark.mainColor.withOpacity(0.6),
      menuBackgroundColor: ColorsDark.blueDark,

    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor.withOpacity(0.6),
      appBar: AdminAppBar(backgroundColor: ColorsDark.blueDark, title: "Easy Shope"),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
