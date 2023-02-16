import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Constant.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Details_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Widgets/DetailsScreen_Widgets.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import 'dart:math' as math;

class AccidentDetails extends StatefulWidget {
  const AccidentDetails({Key? key}) : super(key: key);

  @override
  State<AccidentDetails> createState() => _AccidentDetailsState();
}

class _AccidentDetailsState extends State<AccidentDetails> {
  DetailsController _cont = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            child: Image.asset("assets/images/Logo.png"),
            backgroundColor: const Color.fromARGB(255, 255, 200, 2),
          ),
          title: Text(
            "Details",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFFC6C37),
          centerTitle: true,
        ),
        body: Obx(() => _cont.bucklepoints.value.isNotEmpty
            ? Padding(
                padding: EdgeInsets.all(4),
                child: Victim_car.value == "Honda Civic 2019"
                    ? HondaSimulation(context: context, cont: _cont)
                    : Victim_car.value == "Toyota Corolla 2014"
                        ? CorollaSimulation(context: context, cont: _cont)
                        : Victim_car.value == "Vitz"
                            ? VitzSimulation(context: context, cont: _cont)
                            : Victim_car.value == "Suzuki Alto"
                                ? AltoSimulation(context: context, cont: _cont)
                                : Center(
                                    child: RippleAnimation(
                                      repeat: true,
                                      color: Color.fromARGB(255, 255, 112, 69),
                                      minRadius: 40,
                                      ripplesCount: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 8.0,
                                        backgroundColor: Colors.amber,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
              )
            : Center(
                child: RippleAnimation(
                  repeat: true,
                  color: Color.fromARGB(255, 255, 112, 69),
                  minRadius: 40,
                  ripplesCount: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 8.0,
                    backgroundColor: Colors.amber,
                    color: Colors.green,
                  ),
                ),
              )));
  }
}
