import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_manager_web/constants.dart';
import 'package:employee_manager_web/screens/emp_Details_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';
import '../../controller/emp_details_controller.dart';
import '../../controller/employee_list_controller.dart';
import '../../widgets/new_emp_tab_dialog.dart';
import '../../widgets/tab_update_emp.dart';

class TabHomepage extends StatelessWidget {
  TabHomepage({
    super.key,
    required this.employeeController,
  });

  final EmployeeController employeeController;
  final EmployeeDetailsController employeeDetailsController =
      Get.put(EmployeeDetailsController());
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return NewEmpTabDialog(
                    employeeDetailsController: employeeDetailsController);
              },
            );
          },
        ),
      ),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(left: width(context) * 0.03),
          child: Text(
            'employees',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: height(context) * 0.045,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width(context) * 0.04),
            child: IconButton(
                onPressed: () {
                  authController.signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Obx(() {
        if (employeeController.isLoading.value ||
            employeeController.employeeList.isEmpty) {
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
                        leading: CircleAvatar(
                          radius: height(context) * 0.05,
                          backgroundImage:
                              const CachedNetworkImageProvider(profileimage),
                        ),
                        title: Text(
                          employee.employeeName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            'Age: ${employee.employeeAge} - Salary: ${employee.employeeSalary}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context1) {
                                    return AlertDialog(
                                      title: const Text(
                                          "Do you want to delete this employee?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            color: Colors.red,
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            color: Colors.black,
                                            child: const Text(
                                              "Delete",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            employeeDetailsController
                                                .deleteEmployee(
                                                    employee.id, context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return TabUpdateEmp(
                                        employee: employee,
                                        employeeDetailsController:
                                            employeeDetailsController);
                                  },
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                Get.to(
                                  () => EmpDetailsPage(
                                    age: employee.employeeAge.toString(),
                                    name: employee.employeeName,
                                    salary: employee.employeeSalary.toString(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        ),
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
