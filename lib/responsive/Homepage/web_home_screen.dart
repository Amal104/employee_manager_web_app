import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controller/employee_list_controller.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key, required this.employeeController});

  final EmployeeController employeeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
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
                  elevation: 10,
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
                          padding: const EdgeInsets.only(left: 30),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        backgroundColor: Colors.black,
                                      ),
                                      onPressed: () {},
                                      label: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.white,
                                        ),
                                      ))
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
