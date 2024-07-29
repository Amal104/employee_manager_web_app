import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../model/new_emp_model.dart';

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
    } else {
      throw Exception('Failed to create employee');
    }
  } catch (e) {
    throw Exception('Failed to create employee: $e');
  }
}
