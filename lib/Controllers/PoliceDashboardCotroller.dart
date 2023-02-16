import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/Notification_Model.dart';
import '../Screens/Details_Screen.dart';
import 'Constant.dart';

class PoliceDashBoardController extends GetxController {
  var alerts = List<Accident_Notification>.empty().obs;
  late Accident_Notification newalert;
  var getalerts = true.obs;
  @override
  void onInit() {
    // TODO: implement onIni
    getalerts.value = true;
    GetAllAlerts();
    super.onInit();
  }

  showAlerts() {
    showDialog(
        barrierDismissible: false,
        context: Get.context as BuildContext,
        builder: (cnt) {
          return Dialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(cnt).size.width * 0.9,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                              "VICTIM:\t ${alerts[0].uname}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => Text(
                              "Speed :\t ${alerts[0].speed.round()} Km/h ",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => Text(
                              "Date :\t${alerts[0].accidentdate}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => Text(
                              "Time :\t${alerts[0].accidenttime}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => Text(
                              "Severity :\t${alerts[0].forceoncabin >= 0 && alerts[0].forceoncabin <= 1000 ? "Safe" : alerts[0].forceoncabin > 1000 && alerts[0].forceoncabin < 2000 ? "Normal" : alerts[0].forceoncabin > 2000 && alerts[0].forceoncabin < 3000 ? "High" : alerts[0].forceoncabin > 3000 ? "Critical" : "Critical"}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                )),
                            TextButton(
                                onPressed: () {
                                  Acc_lat = alerts[0].lattitude;
                                  Acc_long = alerts[0].longitude;
                                  Victim_Name = alerts[0].uname;
                                  victimuid = alerts[0].uid;
                                  notiid = alerts[0].nid;

                                  //i'll resume from here
                                  phoneofvictim = alerts[0].uphno.toString();
                                  Total_Force.value = alerts[0].totalforce;
                                  Victim_car.value = alerts[0].car;
                                  HitSide.value = alerts[0].hitside;
                                  ForceOnCabin.value = alerts[0].forceoncabin;
                                  Get.to(() => AccidentDetails());
                                },
                                child: const Text(
                                  "Details",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 60,
                    child: Image.asset(
                      "assets/images/Accident.png",
                      width: 105,
                    ),
                    // Icon(Icons.bus_alert,
                  ), //     size: 80, color: Colors.yellowAccent)),
                  top: -60,
                )
              ],
            ),
          );
        });
  }

  GetAllAlerts() async {
    try {
      while (true) {
        var response = await http.get(Uri.parse(MyUrl.Url + "/GetAllAlert"));
        if (response.statusCode == 200) {
          Iterable itr = jsonDecode(response.body);
          alerts.value =
              itr.map((e) => Accident_Notification.fromMap(e)).toList();
          showAlerts();
          print(jsonDecode(response.body).toString());
        }
        await Future.delayed(Duration(seconds: 60));
      }
    } catch (e) {}
  }
}
