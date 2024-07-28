import 'package:get/get.dart';

import '../model/employee_model.dart';
import '../services/employee_list_service.dart';

class EmployeeController extends GetxController {
  var isLoading = true.obs;
  var employeeList = <Datum>[].obs;

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  void fetchEmployees() async {
    try {
      isLoading(true);
      var employees = await ApiService().fetchEmployees();
      if (employees != null) {
        employeeList.value = employees;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
