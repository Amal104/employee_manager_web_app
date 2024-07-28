import 'package:employee_manager_web/screens/emp_Details_Page.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/employee_model.dart';
import '../services/employee_list_service.dart';

class EmployeeDetailsController extends GetxController {
  var isLoading = true.obs;
  var employeeDetails = <Datum>[].obs;

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
}
