import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/DashboardScreen.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Details_Screen.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/NewAnglePractice.dart';
import 'package:get/get.dart';
import 'Screens/AnglePractice.dart';
import 'Screens/HistorybyDateScreen.dart';
import 'Screens/PoliceDashBoard.dart';
import 'Screens/Splash_Screen.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
