import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_manager_web/constants.dart';
import 'package:employee_manager_web/responsive/Homepage/web_home_screen.dart';
import 'package:employee_manager_web/screens/emp_Details_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/emp_details_controller.dart';
import '../../controller/employee_list_controller.dart';
import '../../widgets/new_emp_dialog.dart';

class TabHomepage extends StatelessWidget {
  TabHomepage({
    super.key,
    required this.employeeController,
  });

  final EmployeeController employeeController;
  final EmployeeDetailsController employeeDetailsController =
      Get.put(EmployeeDetailsController());

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
                return Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Dialog(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.05,
                        vertical: width(context) * 0.05,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add new employee",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: height(context) * 0.03,
                          ),
                          TextField(
                            controller: employeeDetailsController.name,
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter employee name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              fillColor: Colors.black,
                              filled: true,
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(
                            height: height(context) * 0.01,
                          ),
                          TextField(
                            controller: employeeDetailsController.age,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter employee age",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              fillColor: Colors.black,
                              filled: true,
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(
                            height: height(context) * 0.01,
                          ),
                          TextField(
                            controller: employeeDetailsController.salary,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter employee salary",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              fillColor: Colors.black,
                              filled: true,
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(
                            height: height(context) * 0.03,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: const LinearBorder(),
                            ),
                            onPressed: () {
                              if (employeeDetailsController.name.text != "") {
                                employeeDetailsController.createEmployee();
                              } else {
                                Get.snackbar("Invalid", "Enter valid data");
                              }
                            },
                            onHover: (value) {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
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
                onTap: () {
                  employeeDetailsController
                      .fetchEmployeeDetailsData(employee.id);
                  if (employeeDetailsController.employeeDetails.isNotEmpty) {
                    Get.to(() => EmpDetailsPage());
                  } else {
                    Get.snackbar(
                        "Client error", "Response has a status code of 429");
                  }
                },
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
                            radius: height(context) * 0.05,
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
