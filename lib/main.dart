import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth/auth_controller.dart';
import 'screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBwjC0YZiPvwhiLx27Y6j7Xt1xVFdEij4c",
      appId: "1:237999752841:web:ab22fb72a556c9dcaf6858",
      messagingSenderId: "237999752841",
      projectId: "employee-manager-web-app-11dee",
      authDomain: "employee-manager-web-app-11dee.firebaseapp.com",
      storageBucket: "employee-manager-web-app-11dee.appspot.com",
      measurementId: "G-ZE7Y8FB5X3",
    ),
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
      // home: Obx(() {
      //   return authController.isLoggedIn ? Homepage() : const Loginpage();
      // }),
      home: Homepage(),
    );
  }
}
