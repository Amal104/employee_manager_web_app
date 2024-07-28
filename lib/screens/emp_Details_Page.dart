import 'package:employee_manager_web/responsive/Responsive_Layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/employee_list_controller.dart';

class EmpDetailsPage extends StatelessWidget {
   EmpDetailsPage({super.key});

  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: Scaffold(
      ),
      tabletBody: Scaffold(),
      desktopBody: Scaffold(),
    );
  }
}
