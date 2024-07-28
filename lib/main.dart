import 'package:employee_manager_web/auth/auth_state_wrapper.dart';
import 'package:employee_manager_web/firebase_options.dart';
import 'package:employee_manager_web/screens/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/auth_controller.dart';
import 'screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Obx(() {
        return authController.isLoggedIn ? const Homepage() : const Loginpage();
      }),
    );
  }
}