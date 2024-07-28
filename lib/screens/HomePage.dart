import 'package:employee_manager_web/responsive/Homepage/web_home_screen.dart';
import 'package:employee_manager_web/responsive/Responsive_Layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/employee_list_controller.dart';
import '../responsive/Homepage/tab_home_screen.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: Scaffold(),
      tabletBody: TabHomepage(employeeController: employeeController),
      desktopBody: WebHomeScreen(employeeController: employeeController),
    );
  }
}
