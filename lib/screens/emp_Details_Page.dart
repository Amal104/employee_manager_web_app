import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_manager_web/responsive/Responsive_Layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/employee_list_controller.dart';
import '../widgets/emp_details_tab.dart';

class EmpDetailsPage extends StatelessWidget {
  EmpDetailsPage(
      {super.key, required this.name, required this.age, required this.salary});

  final EmployeeController employeeController = Get.put(EmployeeController());

  final String name;
  final String age;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: EmpDetailsTab(name: name, age: age, salary: salary),
      tabletBody: EmpDetailsTab(name: name, age: age, salary: salary),
      desktopBody: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: profileimage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: width(context) * 0.05,
                    ),
                    Container(
                      width: width(context) * 0.5,
                      padding: const EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "age : $age",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "salary : $salary",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "About",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.shade200,
                            ),
                            width: width(context) * 0.8,
                            child: const Text(
                              lorem,
                              maxLines: 5,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
