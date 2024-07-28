import 'package:employee_manager_web/responsive/Responsive_Layout.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: Scaffold(),
      tabletBody: Scaffold(),
      desktopBody: Scaffold(),
    );
  }
}
