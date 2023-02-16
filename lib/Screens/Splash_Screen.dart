import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/DashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigate() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => _prefs.getString("UserName") == null
              ? const Login()
              : const DashBoard()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.maybeOf(context)!.size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFC6C37),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Logo.png",
                height: height * (1 / 3),
              ),
              SizedBox(
                height: height * (1 / 18),
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              )
            ],
          ),
        ),
      )),
    );
  }
}
