
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/emp_details_controller.dart';
import '../model/employee_model.dart';

class TabUpdateEmp extends StatelessWidget {
  const TabUpdateEmp({
    super.key,
    required this.employee,
    required this.employeeDetailsController,
  });

  final Datum employee;
  final EmployeeDetailsController employeeDetailsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Dialog(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width(context) * 0.05,
            vertical: width(context) * 0.05,
          ),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit employee",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                  "name : ${employee.employeeName}"),
              Text(
                  "age : ${employee.employeeAge}"),
              Text(
                  "salary : ${employee.employeeSalary}"),
              SizedBox(
                height: height(context) * 0.03,
              ),
              TextField(
                controller:
                    employeeDetailsController
                        .newname,
                keyboardType:
                    TextInputType.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration:
                    const InputDecoration(
                  hintText:
                      "Enter new employee name",
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
                controller:
                    employeeDetailsController
                        .newage,
                keyboardType:
                    TextInputType.number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration:
                    const InputDecoration(
                  hintText:
                      "Enter new employee age",
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
                controller:
                    employeeDetailsController
                        .newsalary,
                keyboardType:
                    TextInputType.number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration:
                    const InputDecoration(
                  hintText:
                      "Enter new employee salary",
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
                  if (employeeDetailsController
                              .newname.text !=
                          "" &&
                      employeeDetailsController
                              .newage.text !=
                          "" &&
                      employeeDetailsController
                              .newsalary.text !=
                          "") {
                    employeeDetailsController
                        .updateEmployee(
                            employee.id);
                  } else {
                    Get.snackbar("Invalid",
                        "Enter valid data");
                  }
                },
                onHover: (value) {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
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
  }
}
