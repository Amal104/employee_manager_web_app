import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';
import '../../constants.dart';
import '../../screens/RegisterPage.dart';

class WebLoginScreen extends StatelessWidget {
  WebLoginScreen({
    super.key,
  });

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
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
                    "hey\nwelcome back 🎉",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width(context) * 0.045,
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width(context) * 0.7),
                    child: TextField(
                      controller: authController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width(context) * 0.01,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: width(context) * 0.01,
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
                    padding: EdgeInsets.only(right: width(context) * 0.5),
                    child: TextFormField(
                      controller: authController.passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width(context) * 0.01,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: width(context) * 0.01,
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
                      if (authController.emailController.text != "" &&
                          authController.passwordController.text != "") {
                        authController.signIn(
                            authController.emailController.text,
                            authController.passwordController.text,context);
                      } else {
                        Get.snackbar("invalid", "enter email and password",
                          colorText: Colors.red,
                          margin: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.07,
                            vertical: height(context) * 0.05,
                          ),);
                      }
                    },
                    onHover: (value) {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width(context) * 0.01,
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
                        'Dont have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width(context) * 0.01,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const Registerpage());
                        },
                        onHover: (value) {},
                        child: Text(
                          "Register now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: width(context) * 0.01,
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
