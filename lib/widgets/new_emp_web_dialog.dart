
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/emp_details_controller.dart';

class NewEmpWebDialog extends StatelessWidget {
  const NewEmpWebDialog({
    super.key,
    required this.employeeDetailsController,
  });

  final EmployeeDetailsController employeeDetailsController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Dialog(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width(context) * 0.03,
            vertical: width(context) * 0.03,
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
                  fontSize: width(context) * 0.03,
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
                  fontSize: width(context) * 0.01,
                ),
                decoration: InputDecoration(
                  hintText: "Enter employee name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width(context) * 0.01,
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
                  fontSize: width(context) * 0.01,
                ),
                decoration: InputDecoration(
                  hintText: "Enter employee age",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width(context) * 0.01,
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
                  fontSize: width(context) * 0.01,
                ),
                decoration: InputDecoration(
                  hintText: "Enter employee salary",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width(context) * 0.01,
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
                  if (employeeDetailsController.name.text != "" && employeeDetailsController.age.text != "" && employeeDetailsController.salary.text != "") {
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
                      fontSize: width(context) * 0.01,
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
