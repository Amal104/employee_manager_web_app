import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_manager_web/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/employee_list_controller.dart';

class TabHomepage extends StatelessWidget {
  const TabHomepage({
    super.key,
    required this.employeeController,
  });

  final EmployeeController employeeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          'Employees',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: height(context) * 0.045,
          ),
        ),
      ),
      body: Obx(() {
        if (employeeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: employeeController.employeeList.length,
            itemBuilder: (context, index) {
              final employee = employeeController.employeeList[index];
              return InkWell(
                onHover: (value) {},
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.035,
                    vertical: height(context) * 0.005,
                  ),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height(context) * 0.03,
                      ),
                      child: ListTile(
                        leading: Hero(
                          tag: profileimage,
                          child: CircleAvatar(
                            radius: height(context) * 0.01,
                            backgroundImage:
                                const CachedNetworkImageProvider(profileimage),
                          ),
                        ),
                        title: Text(
                          employee.employeeName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            'Age: ${employee.employeeAge} - Salary: ${employee.employeeSalary}'),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
