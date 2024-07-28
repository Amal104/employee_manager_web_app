import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../model/employee_model.dart';

class ApiService {
  final Dio dio = Dio();
  Future<List<Datum>?> fetchEmployees() async {
    List<Datum> data = [];
    try {
      final response = await dio.get('$baseUrl/employees');
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == 200) {
        var json = response.data;
        json['data'].map((e) => data.add(Datum.fromJson(e))).toList();
        if (kDebugMode) {
          print(json);
        }
      } else if (response.statusCode == 429) {
        Get.snackbar("statuscode 429", "Getting too many request");
      } else {
        Get.snackbar("server error", "try after some time");
      }
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
    }
    return data;
  }
}
