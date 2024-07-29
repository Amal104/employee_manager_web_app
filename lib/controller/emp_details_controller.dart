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

  TextEditingController newname = TextEditingController();
  TextEditingController newage = TextEditingController();
  TextEditingController newsalary = TextEditingController();

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
      await EmpManage().createNewEmployee(employee);
      Get.snackbar('Success', 'Employee created successfully',
          colorText: Colors.green);
      Get.back();
      name.clear();
      salary.clear();
      age.clear();
    } catch (e) {
      Get.snackbar('Error', 'Failed to create employee', colorText: Colors.red);
    } finally {
      isLoading(false);
    }
  }

  void updateEmployee(int id) async {
    try {
      isLoading(true);
      Employee employee = Employee(
        name: newname.text,
        salary: newsalary.text,
        age: newage.text,
      );
      await EmpManage().updateNewEmployee(employee, id);
      newname.clear();
      newsalary.clear();
      newage.clear();
      Get.snackbar('Success', 'Employee updated successfully',
          colorText: Colors.green);
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Failed to create employee', colorText: Colors.red);
    } finally {
      isLoading(false);
    }
  }


  void deleteEmployee(int id) async {
    try {
      isLoading(true);
      await EmpManage().deleteEmployee(id);
      Get.snackbar('Success', 'Employee deleted successfully',
          colorText: Colors.green);
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete employee', colorText: Colors.red);
    } finally {
      isLoading(false);
    }
  }

}
