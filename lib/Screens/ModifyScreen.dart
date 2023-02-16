import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Constant.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Modify_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Widgets/ModifyScreenWidgets.dart';
import 'package:get/get.dart';

class Modify extends StatefulWidget {
  const Modify({Key? key}) : super(key: key);

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  final mcontroller = Get.put(ModifyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            child: Image.asset("assets/images/Logo.png"),
            backgroundColor: const Color.fromARGB(255, 255, 200, 2),
          ),
          title: Text(
            "Update WireFrame",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFFC6C37),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(4),
            child: userCar == "Honda Civic 2019"
                ? HondaCivicWireframe(context)
                : userCar == "Toyota Corolla 2014"
                    ? CorollaWireframe(context)
                    : userCar == "Vitz"
                        ? VitzWireframe(context)
                        : userCar == "Suzuki Alto"
                            ? AltoWireframe(context)
                            : Container()));
  }
}
