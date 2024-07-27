import 'package:employee_manager_web/responsive/Responsive_Layout.dart';
import 'package:flutter/material.dart';

import '../responsive/Login/mobile_login_screen.dart';
import '../responsive/Login/tab_login_screen.dart';
import '../responsive/Login/web_login_screen.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: const MobileLoginScreen(),
      tabletBody: const TabLoginScreen(),
      desktopBody: const WebLoginScreen(),
    );
  }
}
