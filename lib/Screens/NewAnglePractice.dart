import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

class Anglef extends StatefulWidget {
  const Anglef({Key? key}) : super(key: key);

  @override
  State<Anglef> createState() => _AnglefState();
}

class _AnglefState extends State<Anglef> {
  var x = 0.0.obs;
  var y = 0.0.obs;
  var z = 0.0.obs;
  var anglex = 0.0.obs;
  var angley = 0.0.obs;
  @override
  void initState() {
    // TODO: implement initState
    _startAccelerometer();
    super.initState();
  }

  late StreamSubscription<AccelerometerEvent> s;
  _startAccelerometer() {
    s = accelerometerEvents.listen((event) async {
      x.value = event.x;
      y.value = event.y;
      z.value = event.z;
      anglex.value = math.atan(
          x.value / (math.sqrt((y.value * y.value) + (z.value * z.value))));
      angley.value = math.atan(
          y.value / (math.sqrt((x.value * x.value) + (z.value * z.value))));
      anglex.value = (anglex.value * (180 / math.pi));
      angley.value = (angley.value * (180 / math.pi));
      double mag = math.sqrt(
          (x.value * x.value) + (y.value * y.value) + (z.value * z.value));
      if (mag > 25) {
        await s.cancel();

        Get.snackbar(
            "Angle", "X Angle:${anglex.value} Y Angle ${angley.value}");

        await Future.delayed(Duration(seconds: 3));
        _startAccelerometer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Angle"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text("x axis :  ${x.value} ")),
              Obx(() => Text("y axis :  ${y.value} ")),
              Obx(() => Text("z axis :  ${z.value} ")),
              SizedBox(
                height: 30,
              ),
              Obx(() => Text("x angle  :  ${anglex.value} ")),
              Obx(() => Text("y axis :  ${angley.value} ")),

              ///Y axis
              // Positioned(
              //     bottom: 10,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("10*")])),
              // Positioned(
              //     bottom: 80,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("20*")])),
              // Positioned(
              //     bottom: 160,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("30*")])),
              // Positioned(
              //     bottom: 240,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("40*")])),
              // Positioned(
              //     bottom: 320,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("50*")])),
              // Positioned(
              //     bottom: 400,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("60*")])),
              // Positioned(
              //     bottom: 480,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("70*")])),
              // Positioned(
              //     bottom: 560,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("80*")])),
              // Positioned(
              //     bottom: 620,
              //     child: Row(children: [Icon(Icons.arrow_forward), Text("90*")])),

              // /// x axis
              // Positioned(
              //     bottom: 0,
              //     left: 20,
              //     child: Row(children: [
              //       Icon(
              //         Icons.arrow_upward,
              //         size: 13,
              //       ),
              //       Text("10*")
              //     ])),
              // Positioned(
              //     bottom: 0,
              //     left: 60,
              //     child: Row(children: [
              //       Icon(Icons.arrow_upward, size: 13),
              //       Text("20*")
              //     ])),
              // Positioned(
              //     bottom: 0,
              //     left: 100,
              //     child: Row(children: [
              //       Icon(Icons.arrow_upward, size: 13),
              //       Text("30*")
              //     ])),
              // Positioned(
              //     bottom: 0,
              //     left: 140,
              //     child: Row(children: [
              //       Icon(Icons.arrow_upward, size: 13),
              //       Text("40*")
              //     ])),
              // Positioned(
              //     bottom: 0,
              //     left: 180,
              //     child: Row(children: [
              //       Icon(Icons.arrow_upward, size: 13),
              //       Text("50*")
              //     ])),
              // Positioned(
              //     bottom: 0,
              //     left: 220,
              //     child: Row(children: [
              //       Icon(Icons.arrow_upward, size: 13),
              //       Text("60*")
              //     ])),
              // Positioned(
              //     bottom: 0,
              //     left: 260,
              //     child: Row(children: [
              //       Icon(Icons.arrow_upward, size: 13),
              //       Text("70*")
              //     ])),
              // Positioned(
              //     bottom: 0,
              //     left: 300,
              //     child: Row(children: [
              //       Icon(Icons.arrow_upward, size: 13),
              //       Text("80*")
              //     ])),
              // Positioned(
              //     bottom: 0,
              //     left: 320,
              //     child: Row(children: [
              //       Icon(Icons.arrow_upward, size: 13),
              //       Text("90*")
              //     ])),
            ],
          ),
        )));
  }
}
