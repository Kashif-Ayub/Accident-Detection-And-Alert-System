import 'dart:convert';
import 'package:fyp_accident_detection_and_alert_system/Models/Login_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/DashboardScreen.dart';
import 'package:get/state_manager.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../Screens/PoliceDashBoard.dart';

class Login_Controller extends GetxController {
  final GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  late TextEditingController phnocontroller;
  late TextEditingController passwordcontroller;
  var isloading_login_button = false.obs;
  var isPasswordHidden = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phnocontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    phnocontroller.clear();
    passwordcontroller.clear();
    phnocontroller.dispose();
    passwordcontroller.dispose();
    super.onClose();
  }

  _CallApi_Login() async {
    try {
      var response = await http.post(
        Uri.parse(MyUrl.Url +
            "/Login?phno=" +
            phnocontroller.value.text +
            "&Password=" +
            passwordcontroller.value.text +
            ""),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print(jsonDecode(response.body));

        LoginModel m = LoginModel.fromMap(jsonDecode(response.body));

        prefs.setString("UserName", m.uname);
        prefs.setInt("uid", m.uid);

        prefs.setString("Phone_Number", phnocontroller.value.text.toString());
        phnocontroller.clear();
        passwordcontroller.clear();
        isloading_login_button.value = false;
        if (m.role == "user") {
          Navigator.of(loginformkey.currentContext!).pushReplacement(
              MaterialPageRoute(builder: ((context) => const DashBoard())));
        } else if (m.role == "police") {
          Navigator.of(loginformkey.currentContext!).pushReplacement(
              MaterialPageRoute(
                  builder: ((context) => const PoliceDashBoard())));
        }
      } else if (response.statusCode == 404) {
        isloading_login_button.value = false;
        Get.snackbar(
          "Login Failed",
          "Invalid Phone Number Or Password",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1),
        );
      } else {
        isloading_login_button.value = false;
        Get.snackbar("No Registered Account",
            "It Seems You Don't Have Account Register Now",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
      }
    } catch (e) {
      print("err  ${e}");
      await const Duration(seconds: 10).delay();
      isloading_login_button.value = false;
      Get.snackbar(
          "Connectivity Issue ", "Server is Down It Will Be Fixed Soon",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
    }
  }

  void Login() {
    isloading_login_button.value = true;
    if (loginformkey.currentState!.validate()) {
      _CallApi_Login();
    } else {
      isloading_login_button.value = false;
      Get.snackbar(
        "INVALID",
        "Kindly provide values to Login",
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        backgroundColor: const Color(0xFFFFDCD1),
      );
    }
  }
}
