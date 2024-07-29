import 'package:employee_manager_web/screens/emp_Details_Page.dart';
import 'package:employee_manager_web/services/new_emp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/employee_model.dart';
import '../model/new_emp_model.dart';
import '../services/employee_list_service.dart';

class EmployeeDetailsController extends GetxController {
  var isLoading = true.obs;
  var employeeDetails = <Datum>[].obs;

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController salary = TextEditingController();

  void fetchEmployeeDetailsData(int id) async {
    try {
      isLoading(true);
      var employees = await ApiService().fetchEmployeeDetails(id);
      if (employees != null) {
        employeeDetails.value = employees;
        if (kDebugMode) {
          print(employeeDetails);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  void createEmployee() async {
    try {
      isLoading(true);
      Employee employee = Employee(
        name: name.text,
        salary: salary.text,
        age: age.text,
      );
      await createNewEmployee(employee);
      Get.snackbar('Success', 'Employee created successfully');
      Get.back();
      name.clear();
      salary.clear();
      age.clear();
    } catch (e) {
      Get.snackbar('Error', 'Failed to create employee');
    } finally {
      isLoading(false);
    }
  }
}
