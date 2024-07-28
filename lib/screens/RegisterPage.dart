import 'package:employee_manager_web/responsive/Register/tab_register_screen.dart';
import 'package:employee_manager_web/responsive/Register/web_register_screen.dart';
import 'package:employee_manager_web/responsive/Responsive_Layout.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: Scaffold(),
      tabletBody: TabRegisterScreen(),
      desktopBody: WebRegisterScreen(),
    );
  }
}
