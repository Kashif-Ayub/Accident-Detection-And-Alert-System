import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Constant.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Buckles.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'Url.dart';

class DetailsController extends GetxController {
  var index = 0.obs;
  var fbumperL = Colors.transparent.obs;
  var fbumperM = Colors.transparent.obs;
  var fbumperR = Colors.transparent.obs;
  var rbumperL = Colors.transparent.obs;
  var rbumperM = Colors.transparent.obs;
  var rbumperR = Colors.transparent.obs;
  var fbarrowL = Colors.transparent.obs;
  var fbarrowM = Colors.transparent.obs;
  var fbarrowR = Colors.transparent.obs;
  var rbarrowL = Colors.transparent.obs;
  var rbarrowM = Colors.transparent.obs;
  var rbarrowR = Colors.transparent.obs;
  var flarrow = Colors.transparent.obs;
  var frarrow = Colors.transparent.obs;
  var rlarrow = Colors.transparent.obs;
  var rrarrow = Colors.transparent.obs;
  var door1 = Colors.transparent.obs;
  var door2 = Colors.transparent.obs;
  var door3 = Colors.transparent.obs;
  var door4 = Colors.transparent.obs;
  var door1arr = Colors.transparent.obs;
  var door2arr = Colors.transparent.obs;
  var door3arr = Colors.transparent.obs;
  var door4arr = Colors.transparent.obs;
  var fleft1 = Colors.transparent.obs;
  var fleft2 = Colors.transparent.obs;
  var fleft3 = Colors.transparent.obs;
  var fleft4 = Colors.transparent.obs;
  var fleft5 = Colors.transparent.obs;
  var fleft6 = Colors.transparent.obs;
  var fleft7 = Colors.transparent.obs;
  var fleft8 = Colors.transparent.obs;
  var fleft9 = Colors.transparent.obs;
  var fleft10 = Colors.transparent.obs;
  var rleft1 = Colors.transparent.obs;
  var rleft2 = Colors.transparent.obs;
  var rleft3 = Colors.transparent.obs;
  var rleft4 = Colors.transparent.obs;
  var rleft5 = Colors.transparent.obs;
  var rleft6 = Colors.transparent.obs;
  var engine = Colors.transparent.obs;
  var bucklepoints = List<BucklePoints>.empty().obs;
  var HitForce = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    HitForce.value = Total_Force.value;
    _GetBucklePoints();
  }

  _GetBucklePoints() async {
    if (Victim_car.value != "" && HitSide.value != "") {
      var response = await http.get(
        Uri.parse(MyUrl.Url +
            "/GetBuckles?cartype=$Victim_car&hitside=$HitSide&uphno=$phoneofvictim"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        Iterable list = jsonDecode(response.body);
        bucklepoints.value = list.map((e) => BucklePoints.FromMap(e)).toList();
        _Simulation_Creator();
      } else if (response.statusCode == 404) {
        print("No Buckles Found");
      }
    }
  }

  _Simulation_Creator() async {
    _HitSideArrow_Creator();
    for (int i = 0; i < bucklepoints.value.length; i++) {
      print("${bucklepoints[i].bucklepoint}\n${bucklepoints[i].bucklepoint}");

      await Future.delayed(const Duration(seconds: 2));
      index.value = i;
      _BucklePointsCreator(bucklepoints[i].bucklepoint);

      HitForce.value = (HitForce.value -
          ((HitForce.value / 100) * bucklepoints[i].bucklepointabs));
    }
  }

  _HitSideArrow_Creator() {
    switch (HitSide.value) {
      case "FrontLeft":
        fbarrowL.value = Colors.black;
        break;
      case "LeftFront":
        flarrow.value = Colors.black;
        break;
      case "FrontRight":
        fbarrowR.value = Colors.black;
        break;
      case "RightFront":
        frarrow.value = Colors.black;
        break;
      case "door1":
        door1arr.value = Colors.black;
        break;
      case "door2":
        door2arr.value = Colors.black;
        break;
      case "door3":
        door3arr.value = Colors.black;
        break;
      case "door4":
        door3arr.value = Colors.black;
        break;
      case "BackLeft":
        rbarrowL.value = Colors.black;
        break;
      case "BackRight":
        rbarrowR.value = Colors.black;
        break;
      case "LeftBack":
        rlarrow.value = Colors.black;
        break;
      case "RightBack":
        rrarrow.value = Colors.black;
        break;
    }
  }

  _BumperPoints() {
    switch (HitSide.value) {
      case "FrontLeft":
        fbumperL.value = Colors.red;
        break;
      case "FrontRight":
        fbumperR.value = Colors.red;
        break;
      case "BackLeft":
        rbumperL.value = Colors.red;
        break;
      case "BackRight":
        rbumperR.value = Colors.red;
        break;
    }
  }

  _BucklePointsCreator(String buckle) {
    switch (buckle) {
      case "fbumper":
        _BumperPoints();
        break;
      case "rbumper":
        _BumperPoints();
        break;
      case "fleft1":
        fleft1.value = Colors.red;
        break;
      case "fleft2":
        fleft2.value = Colors.red;
        break;
      case "fleft3":
        fleft3.value = Colors.red;
        break;
      case "fleft4":
        fleft4.value = Colors.red;
        break;
      case "fleft5":
        fleft5.value = Colors.red;
        break;
      case "fleft6":
        fleft6.value = Colors.red;
        break;
      case "fleft7":
        fleft7.value = Colors.red;
        break;
      case "fleft8":
        fleft8.value = Colors.red;
        break;
      case "fleft9":
        fleft9.value = Colors.red;
        break;
      case "fleft10":
        fleft10.value = Colors.red;
        break;
      case "engine":
        engine.value = Colors.red;
        break;
      case "rleft1":
        rleft1.value = Colors.red;
        break;
      case "rleft2":
        rleft2.value = Colors.red;
        break;
      case "rleft3":
        rleft3.value = Colors.red;
        break;
      case "rleft4":
        rleft4.value = Colors.red;
        break;
      case "rleft5":
        rleft5.value = Colors.red;
        break;
      case "rleft6":
        rleft6.value = Colors.red;
        break;
    }
  }
}
