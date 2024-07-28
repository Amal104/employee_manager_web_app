import 'dart:async';

import 'package:employee_manager_web/screens/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firebaseUser.bindStream(auth.authStateChanges());
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reenterPasswordController =
      TextEditingController();

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar(
        'Success',
        'Account created successfully',
        colorText: Colors.green,
        margin: EdgeInsets.symmetric(
          horizontal: width(context) * 0.07,
          vertical: height(context) * 0.05,
        ),
      );
      Timer(
        const Duration(seconds: 2),
        () {
          Get.off(() => Homepage());
        },
      );
      emailController.clear();
      passwordController.clear();
      reenterPasswordController.clear();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        colorText: Colors.red,
        margin: EdgeInsets.symmetric(
          horizontal: width(context) * 0.07,
          vertical: height(context) * 0.05,
        ),
      );
      emailController.clear();
      passwordController.clear();
      reenterPasswordController.clear();
    }
  }

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        'Success',
        'Logged in successfully',
        colorText: Colors.green,
        margin: EdgeInsets.symmetric(
          horizontal: width(context) * 0.07,
          vertical: height(context) * 0.05,
        ),
      );
      Timer(
        const Duration(seconds: 2),
        () {
          Get.off(() => Homepage());
        },
      );
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        colorText: Colors.red,
        margin: EdgeInsets.symmetric(
          horizontal: width(context) * 0.07,
          vertical: height(context) * 0.05,
        ),
      );
      emailController.clear();
      passwordController.clear();
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  bool get isLoggedIn => firebaseUser.value != null;
}
