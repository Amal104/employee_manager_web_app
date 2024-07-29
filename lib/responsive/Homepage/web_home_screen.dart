import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_manager_web/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controller/emp_details_controller.dart';
import '../../controller/employee_list_controller.dart';
import '../../screens/emp_Details_Page.dart';
import '../../widgets/new_emp_web_dialog.dart';
import '../../widgets/web_update_emp.dart';

class WebHomeScreen extends StatelessWidget {
  WebHomeScreen({super.key, required this.employeeController});

  final EmployeeController employeeController;
  final EmployeeDetailsController employeeDetailsController =
      Get.put(EmployeeDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.deepPurple,
          label: const Text(
            "Add new emloyee",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context1) {
                return NewEmpWebDialog(
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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: employeeController.employeeList.length,
            itemBuilder: (context, index) {
              final employee = employeeController.employeeList[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width(context) * 0.035,
                  vertical: height(context) * 0.030,
                ),
                child: Card(
                  elevation: 9.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: width(context),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: profileimage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height(context) * 0.02,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                employee.employeeName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height(context) * 0.04,
                                ),
                              ),
                              SizedBox(
                                height: height(context) * 0.02,
                              ),
                              Text(
                                " Age : ${employee.employeeAge.toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height(context) * 0.02,
                                ),
                              ),
                              SizedBox(
                                height: height(context) * 0.005,
                              ),
                              Text(
                                " Salary : ${employee.employeeSalary.toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height(context) * 0.02,
                                ),
                              ),
                              SizedBox(
                                height: height(context) * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          backgroundColor: Colors.red,
                                        ),
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      color: Colors.red,
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      employeeDetailsController
                                                          .deleteEmployee(
                                                              employee.id);
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        label: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context1) {
                                              return WebUpdateEmp(
                                                  employee: employee,
                                                  employeeDetailsController:
                                                      employeeDetailsController);
                                            },
                                          );
                                        },
                                        label: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () {
                                      employeeDetailsController
                                          .fetchEmployeeDetailsData(
                                              employee.id);
                                      if (employeeDetailsController
                                          .employeeDetails.isNotEmpty) {
                                        Get.to(() => EmpDetailsPage());
                                      } else {
                                        Get.snackbar("Client error",
                                            "Response has a status code of 429");
                                      }
                                    },
                                    label: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
