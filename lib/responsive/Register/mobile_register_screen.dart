import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';
import '../../constants.dart';
import '../../screens/LoginPage.dart';

class MobileRegisterScreen extends StatelessWidget {
   MobileRegisterScreen({super.key});

   final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: height(context),
              width: width(context),
              child: Image.asset(
                "assets/loginbg.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "hey\nRegister your account",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width(context) * 0.08,
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width(context) * 0.55),
                    child: TextField(
                      controller: authController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width(context) * 0.02,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: width(context) * 0.02,
                        ),
                        fillColor: Colors.black,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width(context) * 0.35),
                    child: TextFormField(
                      controller: authController.passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width(context) * 0.02,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: width(context) * 0.02,
                        ),
                        fillColor: Colors.black,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width(context) * 0.35),
                    child: TextFormField(
                      controller: authController.reenterPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width(context) * 0.02,
                      ),
                      decoration: InputDecoration(
                        hintText: "Reenter your password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: width(context) * 0.02,
                        ),
                        fillColor: Colors.black,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.06,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const LinearBorder(),
                    ),
                    onPressed: () {
                      if (authController.passwordController.text ==
                          authController.reenterPasswordController.text) {
                        authController.signUp(
                          authController.emailController.text,
                          authController.passwordController.text,
                          context,
                        );
                      } else {
                        Get.snackbar(
                          'Error',
                          'Passwords do not match',
                          colorText: Colors.red,
                          margin: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.07,
                            vertical: height(context) * 0.05,
                          ),
                        );
                      }
                    },
                    onHover: (value) {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width(context) * 0.02,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.05,
                  ),
                  Row(
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width(context) * 0.02,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const Loginpage());
                        },
                        onHover: (value) {},
                        child: Text(
                          "Login now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: width(context) * 0.02,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}