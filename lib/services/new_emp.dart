import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../model/new_emp_model.dart';

class EmpManage {
  Future<void> createNewEmployee(Employee employee) async {
    final dio = Dio();
    try {
      final response = await dio.post(
        '$baseUrl/create',
        data: employee.toJson(),
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Employee created successfully: ${response.data}');
        }
        Get.snackbar('Success', 'Employee created successfully',
            colorText: Colors.green);
      } else {
        throw Exception('Failed to create employee');
      }
    } catch (e) {
      throw Exception('Failed to create employee: $e');
    }
  }

  Future<void> updateNewEmployee(Employee employee, int id) async {
    final dio = Dio();
    try {
      if (kDebugMode) {
        print('$baseUrl/update/$id');
      }
      if (kDebugMode) {
        print(employee.toJson());
      }
      final response = await dio.put(
        '$baseUrl/update/$id',
        data: employee.toJson(),
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Employee updated successfully: ${response.data}');
        }
        Get.snackbar('Success', 'Employee updated successfully',
            colorText: Colors.green);
      } else {
        throw Exception('Failed to update employee');
      }
    } catch (e) {
      throw Exception('Failed to update employee: $e');
    }
  }


  
  Future<void> deleteEmployee(int id) async {
    final dio = Dio();
    try {
      if (kDebugMode) {
        print('$baseUrl/delete/$id');
      }
      final response = await dio.put(
        '$baseUrl/delete/$id',
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Employee deleted successfully: ${response.data}');
        }
        Get.snackbar('Success', 'Employee deleted successfully',
            colorText: Colors.green);
      } else {
        throw Exception('Failed to delete employee');
      }
    } catch (e) {
      throw Exception('Failed to delete employee: $e');
    }
  }

}
