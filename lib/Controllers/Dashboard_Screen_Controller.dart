import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Constant.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Google_Maps_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Accident_Location_Track.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Buckles.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Notification_Model.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Register_Model_CarType.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Details_Screen.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Google_Map_Screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';
import 'dart:math' as math;

import '../Models/Responder_Location_Track.dart';
import 'Contacts_Screen_Controller.dart';

class DashBoard_Screen_Controller extends GetxController {
  late StreamSubscription<Position> strm;
  late StreamSubscription<Position> stream1;
  late StreamSubscription<AccelerometerEvent> stream;
  late StreamSubscription _internetStream;
  var speed = 0.0.obs;
  var speedms = 0.0.obs;
  var HitForce = 0.0.obs;
  var safetybelt = false.obs;
  var airbag = false.obs;
  var TotalHitForce = 0.0.obs;
  var getstartedicon = Icons.play_circle_fill.obs;
  var Username = "".obs;
  var canmarksafe = false.obs;

  var Selected_val_seat = "".obs;
  final lst = List<dynamic>.empty().obs;
  var colr = Colors.deepOrange.obs;
  var condition = "".obs;
  List<BucklePoints> buckvals = [];
  var isloading = true.obs;
  final is_started = false.obs;
  var Driving_seat = Color.fromARGB(255, 2, 250, 130).obs;
  var Front_seat = Colors.transparent.obs;
  var BackLeft_seat = Colors.transparent.obs;
  var BackMiddle_seat = Colors.transparent.obs;
  var BackRight_seat = Colors.transparent.obs;
  Connectivity _connectivity = Connectivity();
  late double msglat = 0.0, msglong = 0.0;
  final lsts = ["Driving", "Front", "Back Left ", "Back Middle", "Back Right"];
  var usrcars = 0.obs;
  var txt = "Get Started".obs;
  var x = 0.0.obs;
  var y = 0.0.obs;
  var z = 0.0.obs;
  var time = 0.0.obs;
  var ttltime = 0.obs;
  var x_is_neg = false.obs;
  var y_is_neg = false.obs;
  var z_is_neg = false.obs;
  var magnitude = 0.0.obs;
  String hitside = "";
  var cval = 0.obs;
  var connected = false.obs;
  bool terminate = false;
  var notificationlst = List<Accident_Notification>.empty().obs;
  List<String> econts = [];
  GlobalKey<KdGaugeViewState> gkey = GlobalKey<KdGaugeViewState>();
  Contacts_Controller c = Get.put(Contacts_Controller());
  int nid = 0;

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();

    c.getEemergencyContacts();
    _CheckInternetConnection();
    _AskForPermissions(() {});
    Selected_val_seat.value = lsts[0];
    lst.value.add("Honda Civic 2019");
    lst.value.add("Toyota Corolla 2014");
    lst.value.add("Vitz");
    lst.value.add("Suzuki Alto");
    await getCarsCategories_usercar();
    await Get_Username();
    await _GetAlerts();
  }

  _CheckInternetConnection() {
    _internetStream = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        connected.value = true;
      } else {
        connected.value = false;
      }
    });
  }

  void _sendSMS(
      {required String message, required List<String> recepients}) async {
    String _result = await sendSMS(
            message: message, recipients: recepients, sendDirect: true)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  Future<void> CalcSpeed() async {
    Get.snackbar("Time Interval ${timeInterval.value}",
        "Time Interval ${timeInterval.value}");
    start_long.value = (start_long.value / (180 / math.pi));
    n_long.value = (n_long.value / (180 / math.pi));
    start_lat.value = (start_lat.value / (180 / math.pi));
    n_lat.value = (n_lat.value / (180 / math.pi));
    //Haversine Formula
    double dlon = n_long.value - start_long.value;
    double dlat = n_lat.value - start_lat.value;
    var a = math.pow(math.sin(dlat / 2), 2) +
        math.cos(start_lat.value) *
            math.cos(n_lat.value) *
            math.pow(math.sin(dlon / 2), 2);
    double c = 2 * math.sin(math.sqrt(a));
    //added 5 here to manage speed
    speed.value = ((c * 6371) / ((timeInterval.value + 1) * 60));
    gkey.currentState?.updateSpeed(speed.value,
        animate: true, duration: const Duration(seconds: 2));
    Get.snackbar("${speed.value} KM/h", "${speed.value} KM/h");

    speedms.value = ((speed.value * 1000) / 3600);
    print("${speed.value}");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _internetStream.cancel();
    super.onClose();
  }

  ShowMap() async {
    showDialog(
        barrierDismissible: false,
        context: Get.context as BuildContext,
        builder: (cnt) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: dialoguemp());
        });
  }

  _GetAlerts() async {
    try {
      DateTime dateToday = new DateTime.now();
      var formaterdate = DateFormat('dd/MM/yy');
      date = formaterdate.format(dateToday);
      print("called get Alerts");
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      String cont = _prefs.getString("Phone_Number").toString();
      var response = await http
          .get(Uri.parse(MyUrl.Url + "/GetAlerts?contact=$cont&&date=$date"));
      print(MyUrl.Url +
          "/GetAlerts?contact=" +
          _prefs.getString("Phone_Number").toString() +
          "");

      if (response.statusCode == 200) {
        print(response.body);
        Iterable notilst = jsonDecode(response.body);
        notificationlst.value =
            notilst.map((e) => Accident_Notification.fromMap(e)).toList();
        await const Duration(seconds: 3).delay();
        if (notificationlst.value.isNotEmpty) {
          Acc_lat = notificationlst[0].lattitude;
          Acc_long = notificationlst[0].longitude;
          Victim_Name = notificationlst[0].uname;
          victimuid = notificationlst[0].uid;
          notiid = notificationlst[0].nid;

          //i'll resume from here
          phoneofvictim = notificationlst[0].uphno.toString();
          Total_Force.value = notificationlst[0].totalforce;
          Victim_car.value = notificationlst[0].car;
          HitSide.value = notificationlst[0].hitside;
          ForceOnCabin.value = notificationlst[0].forceoncabin;
          notificationlst[0].forceoncabin >= 0 &&
                  notificationlst[0].forceoncabin <= 1000
              ? condition.value = "Safe"
              : notificationlst[0].forceoncabin > 1000 &&
                      notificationlst[0].forceoncabin < 2000
                  ? condition.value = "Normal"
                  : notificationlst[0].forceoncabin > 2000 &&
                          notificationlst[0].forceoncabin < 3000
                      ? condition.value = "High"
                      : notificationlst[0].forceoncabin > 3000
                          ? condition.value = "Critical"
                          : condition.value = "Critical";

          showDialog(
              barrierDismissible: false,
              context: Get.context as BuildContext,
              builder: (cnt) {
                return Dialog(
                  backgroundColor: condition.value == "Safe"
                      ? Color.fromARGB(255, 221, 238, 201)
                      : condition.value == "Normal"
                          ? Color.fromARGB(255, 245, 225, 166)
                          : condition.value == "High"
                              ? Color.fromARGB(255, 250, 204, 136)
                              : Color.fromARGB(255, 233, 178, 174),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 250,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() => Text(
                                    "VICTIM: ${notificationlst[0].uname}",
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
                                    "Speed : ${notificationlst[0].speed.round()} Km/h ",
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
                                    "Severity : ${condition.value} ",
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                  "Press Navigate to See Accident Location"),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                        Get.to(const Google_Map());
                                      },
                                      child: const Text(
                                        "Navigate",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                        Get.to(() => AccidentDetails());
                                      },
                                      child: const Text(
                                        "Details",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 18),
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
      }
      if (response.statusCode == 404) {
        Get.snackbar("No Alerts  ", "No Emergency Alerts Are Created Yet",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
          "Connectivity Issue ", "Server is Down It Will Be Fixed Soon",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
    }
  }

  _AskForPermissions(Function f) async {
    var status = await Permission.sms.request();
    if (status.isGranted) {
      // getAllContacts();
    } else if (status.isDenied) {
      status = await Permission.sms.request();
      Get.snackbar("SMS Access Required",
          "Allow the Permission to Automatically Send SMS",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
    }
    if (await Permission.contacts.request().isGranted) {
      // getAllContacts();
    } else if (await Permission.contacts.isPermanentlyDenied) {
      status = await Permission.sms.request();
      Get.snackbar("Permenantly denied ", "Can't SEND SMS",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: Color(0xFFFFDCD1));
      // Get.back();
    }

    if (await Geolocator.isLocationServiceEnabled()) {
      if (await Permission.location.request().isGranted) {
        if (await Permission.locationAlways.request().isGranted) {
          f();
          return;
        } else {
          Get.snackbar("Loaction Permission ",
              "Kindly Allow All the Time Access to Location ",
              snackPosition: SnackPosition.BOTTOM,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
              backgroundColor: const Color(0xFFFFDCD1));
        }
      } else {
        Get.snackbar("Loaction Permission ",
            "Kindly Allow All the Time Access to Location ",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
        if (await Permission.locationAlways.request().isGranted) {
        } else {
          Get.snackbar("Loaction Permission ",
              "Kindly Allow All the Time Access to Location ",
              snackPosition: SnackPosition.BOTTOM,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
              backgroundColor: const Color(0xFFFFDCD1));
        }
      }
    } else {
      Geolocator.openLocationSettings();
      if (await Permission.locationAlways.request().isGranted) {
      } else {
        Get.snackbar("Loaction Permission ",
            "Kindly Allow All the Time Access to Location ",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
      }
    }
  }

  getCarsCategories_usercar() async {
    print("called");

    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      String num = _prefs.getString("Phone_Number")!;
      print("Number:$num");
      var response = await http.post(
        Uri.parse(MyUrl.Url + "/GetCars?phno=" + num + ""),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
      if (response.statusCode == 200) {
        Iterable ucars = jsonDecode(response.body);
        List<CarType> carlst = ucars.map((e) => CarType.fromMap(e)).toList();
        Ucars = carlst;
        for (int i = 0; i < carlst.length; i++) {
          if (lst.contains(carlst[i].vtype)) {
          } else {
            lst.add(carlst[i].vtype);
          }
        }
        userCar = carlst[0].vtype;
        Selected_val_car.value = carlst[0].vtype;
        print(carlst[0].vtype);
        isloading.value = false;
      }
    } catch (e) {
      Get.snackbar(
          "Connectivity Issue ", "Server is Down It Will Be Fixed Soon",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
    }
  }

  MyTimer() {
    time.value = 0;
    final periodictimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time.value++;
      if (txt.value == "Get Started" && is_started.value == false) {
        // Get.snackbar("Stopped",
        //     "Timer Stoped ${time.value}  and  prev Time val ${ttltime.value} Speed is ${speedms.value} ");

        // ttltime.value = time.value;
        // time.value = 0;
        timer.cancel();
      }
    });
  }

  _CounterVal() async {
    int x = 10;
    while (x != -1 && terminate == false) {
      cval.value = x;
      x--;

      await const Duration(seconds: 1).delay();
    }
    // Get.back();
    // if (x == -1) {
    //   await _Save_Notification();

    if (connected.value == false) {
      if (clist.value.isNotEmpty) {
        for (int i = 0; i < clist.length; i++) {
          econts.add(clist[i].cphno);
        }
      }
      Position p = await Geolocator.getCurrentPosition();
      msglat = p.latitude;
      msglong = p.longitude;

      var latlong = "$msglong,$msglat";
      var maplink = "http://www.google.com/maps/place/$latlong";
      _sendSMS(
          message:
              "$Username got Accident \n\nCLICK ON THE LINK TO SEE THE $Username's LOCATION\n\n\n$maplink ",
          recepients: econts);
    }
    //   _Update_AccidentLocation();
    // }
  }

//   Future<void> MarkHitSide() async {
//     showDialog(
//         barrierDismissible: false,
//         context: Get.context as BuildContext,
//         builder: (cnt) {
//           return Dialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.topCenter,
//               children: [
//                 Positioned(
//                   child: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 60,
//                       child: Image.asset("assets/images/alertlogo.png")
//                       // Icon(Icons.delete, size: 50, color: Colors.white)

//                       ),
//                   top: -60,
//                 ),
//                 Positioned(
//                   top: 120,
//                   height: 500,
//                   child: Image.asset("assets/images/seatselect.png"),
//                 ),
//                 Positioned(
//                     top: 75,
//                     width: 20,
//                     height: 20,
//                     child: Icon(
//                       Icons.arrow_downward,
//                       size: 40,
//                     )),
//                 Positioned(
//                     top: 75,
//                     left: 70,
//                     width: 20,
//                     height: 20,
//                     child: Icon(
//                       Icons.arrow_downward,
//                       size: 40,
//                     )),
//                 Positioned(
//                     top: 75,
//                     width: 20,
//                     height: 20,
//                     right: 70,
//                     child: Icon(
//                       Icons.arrow_downward,
//                       size: 40,
//                     )),
//                 Positioned(
//                   top: 120,
//                   left: 30,
//                   child: Transform.rotate(
//                     angle: 180 * math.pi / 49,
//                     child: SizedBox(
//                         height: 40,
//                         width: 20,
//                         child: Icon(
//                           Icons.arrow_downward,
//                           size: 40,
//                         )),
//                   ),
//                 ),
//                 Positioned(
//                   top: 100,
//                   right: 30,
//                   child: Transform.rotate(
//                     angle: -(180 * math.pi / 49),
//                     child: SizedBox(
//                         height: 40,
//                         width: 20,
//                         child: Icon(
//                           Icons.arrow_downward,
//                           size: 40,
//                         )),
//                   ),
//                 ),
//                 //fl
//                 Positioned(
//                     top: 190,
//                     width: 20,
//                     height: 20,
//                     left: 10,
//                     child: Icon(
//                       Icons.arrow_forward,
//                       size: 40,
//                     )),
//                 //fr
//                 Positioned(
//                     top: 190,
//                     width: 20,
//                     height: 20,
//                     right: 18,
//                     child: Icon(
//                       Icons.arrow_back,
//                       size: 40,
//                     )),

// //door1
//                 Positioned(
//                     top: 290,
//                     width: 20,
//                     height: 20,
//                     left: 10,
//                     child: Icon(
//                       Icons.arrow_forward,
//                       size: 40,
//                     )),
//                 //door2
//                 Positioned(
//                     top: 290,
//                     width: 20,
//                     height: 20,
//                     right: 18,
//                     child: Icon(
//                       Icons.arrow_back,
//                       size: 40,
//                     )),
//                 //door3
//                 Positioned(
//                     top: 420,
//                     width: 20,
//                     height: 20,
//                     left: 10,
//                     child: Icon(
//                       Icons.arrow_forward,
//                       size: 40,
//                     )),
//                 //door4
//                 Positioned(
//                     top: 420,
//                     width: 20,
//                     height: 20,
//                     right: 18,
//                     child: Icon(
//                       Icons.arrow_back,
//                       size: 40,
//                     )),
//                 //rleft
//                 Positioned(
//                     top: 540,
//                     width: 20,
//                     height: 20,
//                     left: 10,
//                     child: Icon(
//                       Icons.arrow_forward,
//                       size: 40,
//                     )),
//                 //rright
//                 Positioned(
//                     top: 540,
//                     width: 20,
//                     height: 20,
//                     right: 18,
//                     child: Icon(
//                       Icons.arrow_back,
//                       size: 40,
//                     )),

//                 Positioned(
//                     top: 605,
//                     left: 70,
//                     width: 20,
//                     height: 20,
//                     child: Icon(
//                       Icons.arrow_upward,
//                       size: 40,
//                     )),
//                 Positioned(
//                     top: 605,
//                     width: 20,
//                     height: 20,
//                     right: 70,
//                     child: Icon(
//                       Icons.arrow_upward,
//                       size: 40,
//                     )),
//                 Positioned(
//                     top: 605,
//                     width: 20,
//                     height: 20,
//                     child: Icon(
//                       Icons.arrow_upward,
//                       size: 40,
//                     )),
//               ],
//             ),
//           );
//         });
//   }

  StartAccidentDetection() {
    if (is_started == true && txt.value == "Stop") {
      stream = accelerometerEvents.listen((AccelerometerEvent event) {});
      stream.onData((AccelerometerEvent e) async {
        x.value = e.x;
        y.value = e.y;
        z.value = e.z;
        magnitude.value = math.sqrt(
            ((x.value * x.value) + (y.value * y.value) + (z.value * z.value)));
        if (magnitude.value > 35) {
          threshold.value = 35;
          //   stream.pause();
          stream.cancel();
          terminate = false;

          if (x.value < 0) {
            x.value = -1 * (x.value);
            x_is_neg.value = true;
          }
          if (y.value < 0) {
            y.value = -1 * (y.value);
            y_is_neg.value = true;
          }
          if (z.value < 0) {
            z.value = -1 * (z.value);
            z_is_neg.value = true;
          }
          if (x.value > y.value) {
            if (x_is_neg.value) {
              // Get.snackbar("Moving Left", "Moving Left");
              if (y_is_neg.value) {
                if (y.value > 1) {
                  // Get.snackbar("Moving Left  Front Forward",
                  //     "Moving  Left Front Forward");
                  hitside = "LeftFront";
                } else {
                  if (y.value <= 1) {
                    // Get.snackbar("Cabin Left  Back Backward",
                    //     "Cabin  Left Back Backward");
                    hitside = "doo3";
                  }
                }
              } else {
                if (y.value > 1) {
                  // Get.snackbar("Moving Left  Back Backward",
                  //     "Moving  Left Back Backward");
                  hitside = "LeftBack";
                } else {
                  if (y.value <= 1) {
                    // Get.snackbar("Cabin Left  Front Forward",
                    //     "Cabin Left Front Forward");

                    hitside = "door1";
                  }
                }
              }
            } else {
              // Get.snackbar("Moving Right", "Moving Right");
              if (y_is_neg.value) {
                if (y.value > 1) {
                  // Get.snackbar("Moving Right  Front Forward",
                  //     "Moving  Right Front Forward");
                  hitside = "RightFront";
                } else {
                  // Get.snackbar("Cabin Right  Front Forward",
                  //     "Cabin  Right Front Forward");
                  hitside = "door4";
                }
              } else {
                if (y.value > 1) {
                  // Get.snackbar("Moving Right  Back Backward",
                  //     "Moving  Right Back Backward");
                  hitside = "RightBack";
                } else {
                  // Get.snackbar("Cabin Right  Back Backward",
                  //     "Cabin  Right Back Backward");
                  hitside = "door2";
                }
              }
            }
          } else if (y.value > x.value) {
            if (y_is_neg.value) {
              // Get.snackbar("Moving Front Forward", "Moving Front Forward");
              if (x_is_neg.value) {
                if (x.value < 2) {
                  // Get.snackbar("Head On Collision", "Front");
                  hitside = "Front";
                } else {
                  // Get.snackbar("Moving  Front Left Forward",
                  //     "Moving  Front Left Forward");
                  hitside = "FrontLeft";
                }
              } else {
                if (x.value < 2) {
                  // Get.snackbar("Head On Collision", "Front");
                  hitside = "Front";
                } else {
                  // Get.snackbar("Moving  Front Right Forward",
                  //     "Moving  Front Right Forward");
                  hitside = "FrontRight";
                }
              }
            } else {
              // Get.snackbar("Moving Back Backward", "Moving Back Backward");
              if (x_is_neg.value) {
                if (x.value < 2) {
                  //  Get.snackbar("Reverse Collision", "Back");
                  hitside = "Back";
                } else {
                  // Get.snackbar("Moving  Back Left Backward",
                  //     "Moving  Back Left Backward");
                  hitside = "BackLeft";
                }
              } else {
                if (x.value < 2) {
                  // Get.snackbar("Reverse Collision", "Back");
                  hitside = "Back";
                } else {
                  // Get.snackbar("Moving  Back Right Backward",
                  //     "Moving  Back Right Backward");
                  hitside = "BackRight";
                }
              }
            }
          }
          _CounterVal();
          showDialog(
              barrierDismissible: false,
              context: Get.context as BuildContext,
              builder: (cnt) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                          child: Column(
                            children: [
                              const Text(
                                "Accident Detected",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Obx(() => Text(
                              //     "Magnitude:${magnitude.value.round()}             Thresh hold:30   ")),
                              // Obx(() => Text(
                              //     "X-axis:${x.round()}    Y-axis:${y.round()}    Z-axis:${z.round()} ")),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              const Text(
                                "Alert Sending in",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Obx(
                                () => Text(
                                  "${cval.value} ",
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () async {
                                        stream.cancel();
                                        terminate = true;
                                        Get.back();

                                        //   await Save_Notification();
                                        //await MarkHitSide();
                                        if (connected.value == false) {
                                          if (clist.value.isNotEmpty) {
                                            for (int i = 0;
                                                i < clist.length;
                                                i++) {
                                              econts.add(clist[i].cphno);
                                            }
                                          }
                                          Position p = await Geolocator
                                              .getCurrentPosition(
                                                  desiredAccuracy:
                                                      LocationAccuracy.high);
                                          msglat = p.latitude;
                                          msglong = p.longitude;
                                          var latlong = "$msglong,$msglat";
                                          var maplink =
                                              "http://www.google.com/maps/place/$latlong";
                                          _sendSMS(
                                              message:
                                                  "$Username got Accident \nCLICK ON THE LINK TO SEE THE $Username's LOCATION\n\n\n$maplink ",
                                              recepients: econts);
                                        }
                                        //   await _Update_AccidentLocation();
                                      },
                                      child: const Text(
                                        "Send",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        stream.pause();
                                        stream.cancel();
                                        Get.back();
                                        terminate = true;
                                        threshold.value = 0;
                                        await const Duration(seconds: 2)
                                            .delay();

                                        StartAccidentDetection();
                                      },
                                      child: const Text(
                                        "Abort",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 18),
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
                            child: Image.asset("assets/images/alertlogo.png")
                            // Icon(Icons.delete, size: 50, color: Colors.white)

                            ),
                        top: -60,
                      )
                    ],
                  ),
                );
              });
          print("detected");
        }
      });
      x.value = 0.0;
      y.value = 0.0;
      z.value = 0.0;
      magnitude.value = 0.0;
    } else {
      return;
    }
  }

  Get_Username() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Username.value = prefs.getString("UserName").toString();
  }

  // void updateSpeed() async {
  //   speed.value = 0;
  //   while (is_started.value == true && txt.value == "Stop") {
  //     print("running");
  //     await const Duration(milliseconds: 800).delay();
  //     bool serviceEnabled;
  //     LocationPermission permission;
  //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //     if (!serviceEnabled) {
  //       Get.snackbar("Enable Location ",
  //           "Enable Location Services to access Your Location...",
  //           snackPosition: SnackPosition.BOTTOM,
  //           padding: const EdgeInsets.all(20),
  //           margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
  //           backgroundColor: const Color(0xFFFFDCD1));
  //       await const Duration(seconds: 4).delay();
  //       Geolocator.openLocationSettings();
  //       // return Future.error("Location Services are disabled");
  //     }
  //     permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       if (permission == LocationPermission.denied) {
  //         Get.snackbar("Allow Location Permission ",
  //             "Cannot Start Our App Services Without Accessing Location",
  //             snackPosition: SnackPosition.BOTTOM,
  //             padding: const EdgeInsets.all(20),
  //             margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
  //             backgroundColor: const Color(0xFFFFDCD1));
  //         txt.value = "Get Started";
  //         is_started.value = false;
  //         colr.value = Colors.deepOrange;
  //         return;
  //       }
  //     }
  //     if (permission == LocationPermission.deniedForever) {
  //       Get.snackbar("Allow Location Permission ",
  //           "Cannot Start Our App Services Without Accessing Location",
  //           snackPosition: SnackPosition.BOTTOM,
  //           padding: const EdgeInsets.all(20),
  //           margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
  //           backgroundColor: const Color(0xFFFFDCD1));
  //       txt.value = "Get Started";
  //       is_started.value = false;
  //       colr.value = Colors.deepOrange;

  //       return;
  //     }
  //     print("updating speed");
  //     strm = Geolocator.getPositionStream().listen((p) {
  //       speedms.value = p.speed;
  //       speed.value = double.parse(
  //           ((p.speed.round() * 3.6).round()).toStringAsPrecision(2));

  //       gkey.currentState?.updateSpeed(speed.value,
  //           animate: true, duration: const Duration(seconds: 2));
  //     });
  //   }
  // }

  Update_AccidentLocation() async {
    print("_Update_AccidentLocation Called");
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    _AskForPermissions(() async {
      // stream1 = Geolocator.getPositionStream(locationSettings: locationSettings)
      //     .listen((event) {});
      // stream1.onData((data) async {
      try {
        AccidentLocationTrack trc = AccidentLocationTrack(
            altid: 0,
            uid: _prefs.getInt("uid")!,
            latitude: a_lat.value,
            longitude: a_long.value,
            nid: nid);
        var response = await http.post(
            Uri.parse(MyUrl.Url + "/UpdateLiveCoordinatesAccident"),
            headers: <String, String>{
              'Content-Type': 'application/json;charset=UTF-8'
            },
            body: jsonEncode(trc.toMap()));
        if (response.statusCode == 200) {
          print(trc.toMap().toString());
          Get.snackbar("Accident Location Updated ",
              "Live Location Updated Successfully",
              snackPosition: SnackPosition.BOTTOM,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
              backgroundColor: Color(0xFFFFDCD1));
        }
      } catch (e) {
        Get.snackbar(
            "Connectivity Issue ", "Server is Down It Will Be Fixed Soon",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
      }
      // });
    });
  }

  _VictimConditionChecking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var phone = prefs.getString("Phone_Number");
    var response = await http.get(
      Uri.parse(MyUrl.Url +
          "/GetBuckles?cartype=$Selected_val_car&hitside=$hitside&uphno=$phone"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      buckvals = list.map((e) => BucklePoints.FromMap(e)).toList();
      buckvals.forEach((element) {
        HitForce.value = (HitForce.value -
            ((HitForce.value / 100) * element.bucklepointabs));
      });
      if (safetybelt.value) {
        HitForce.value = (HitForce.value - ((HitForce.value / 100) * 2));
      }
      //  "Driving", "Front", "Back Left ", "Back Middle", "Back Right"
      switch (hitside) {
        case "FrontLeft":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 2));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 10));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 12));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 15));
          }

          break;
        case "FrontRight":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 2));
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 15));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 12));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 10));
          }
          break;
        case "LeftFront":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "Front") {
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 2));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 6));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 8));
          }
          break;
        case "RightFront":
          if (Selected_val_seat.value == "Driving") {
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 8));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 6));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 2));
          }
          break;
        case "door1":
          if (Selected_val_seat.value == "Driving") {
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 2));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 6));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 4));
          }
          break;
        case "door2":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 2));
          } else if (Selected_val_seat.value == "Front") {
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 4));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 6));
          }
          break;
        case "door3":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 2));
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 3));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 1));
          } else if (Selected_val_seat.value == "BackRight") {}
          break;
        case "door4":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 2));
          } else if (Selected_val_seat.value == "BackLeft") {
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 1));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 3));
          }
          break;
        case "LeftBack":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 8));
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 6));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 2));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 3));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 4));
          }
          break;
        case "RightBack":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 6));
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 8));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 4));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 3));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 2));
          }
          break;
        case "BackLeft":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 8));
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 6));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 3));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 4));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 5));
          }

          break;
        case "BackRight":
          if (Selected_val_seat.value == "Driving") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 6));
          } else if (Selected_val_seat.value == "Front") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 8));
          } else if (Selected_val_seat.value == "BackLeft") {
            HitForce.value = (HitForce.value - ((HitForce.value / 100) * 5));
          } else if (Selected_val_seat.value == "BackMiddle") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 4));
          } else if (Selected_val_seat.value == "BackRight") {
            HitForce.value == (HitForce.value - ((HitForce.value / 100) * 3));
          }
          break;
      }

      Get.snackbar("Force on Cabin", "${HitForce.value}");
    } else if (response.statusCode == 404) {
      print("No Buckles Found");
    }
  }

  Future<void> _CalcForce() async {
    // honda civic weight  1353kg
    //toyota corolla 1275 kg
    // vitz 1010 kg
    //alto 920 kg
    time.value = timeInterval.value + 1;
    if (Selected_val_car.value == "Honda Civic 2019") {
      //f=ma
      HitForce.value = 1353 * ((speedms.value - 0) / time.value);
      Get.snackbar("${Selected_val_car.value}", "fORCE=${HitForce.value}");
    } else if (Selected_val_car.value == "Toyota Corolla 2014") {
      HitForce.value = 1275 * ((speedms.value - 0) / time.value);
      Get.snackbar("${Selected_val_car.value}", "fORCE=${HitForce.value}");
    } else if (Selected_val_car.value == "Vitz") {
      HitForce.value = 1010 * ((speedms.value - 0) / time.value);
      Get.snackbar("${Selected_val_car.value}", "fORCE=${HitForce.value}");
    } else if (Selected_val_car.value == "Suzuki Alto") {
      HitForce.value = 920 * ((speedms.value - 0) / time.value);
      Get.snackbar("${Selected_val_car.value}", "fORCE=${HitForce.value}");
    }
    TotalHitForce.value = HitForce.value;
  }

  Save_Notification() async {
    try {
      txt.value = "Get Started";
      getstartedicon.value = Icons.play_circle_fill;
      colr.value = Colors.deepOrange;

      /// stream.pause();
      stream.cancel();

      ///  strm.pause();
      //  strm.cancel();
      is_started.value = false;
      DateTime dateToday = new DateTime.now();
      var formaterdate = DateFormat('dd/MM/yy');
      date = formaterdate.format(dateToday);
      ntime = DateFormat.jm().format(dateToday);
      await _CalcForce();
      await _VictimConditionChecking();

      print("called");
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      Accident_Notification noti = Accident_Notification(
          nid: 0,
          uid: _prefs.getInt("uid")!,
          forceoncabin: HitForce.value,
          Message: "Accident....",
          speed: speed.value,
          longitude: n_long.value,
          lattitude: n_lat.value,
          car: Selected_val_car.value,
          hitside: hitside,
          totalforce: TotalHitForce.value,
          accidentdate: date,
          accidenttime: ntime,
          status: 'NotSafe');
      var response = await http.post(
          Uri.parse(MyUrl.Url + "/Generate_Notification"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: jsonEncode(noti.toMap()));
      if (response.statusCode == 200) {
        canmarksafe.value = true;
        nid = jsonDecode(response.body);
        txt.value = "Get Started";
        getstartedicon.value = Icons.play_circle_fill;
        colr.value = Colors.deepOrange;
        Get.snackbar("Notification ", "Notification Generated Successfully",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
      }
    } catch (e) {
      Get.snackbar(
          "Connectivity Issue ", "Server is Down It Will Be Fixed Soon",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
    }
  }
}

class dialoguemp extends StatefulWidget {
  const dialoguemp({Key? key}) : super(key: key);

  @override
  State<dialoguemp> createState() => _dialoguempState();
}

class _dialoguempState extends State<dialoguemp> {
  var markers = List<Marker>.empty().obs;
  var polylines = List<Polyline>.empty().obs;
  late CameraPosition initialcameraposition =
      CameraPosition(target: LatLng(33.34534, 73.23424), zoom: 13.55);
  bool marked = true;
  var i = 0.0.obs;
  var clat = 0.0.obs;
  var clong = 0.0.obs;
  Future<void> getCurrentLocation() async {
    Position p = await Geolocator.getCurrentPosition();
    clat.value = p.latitude;
    clong.value = p.longitude;
    // initialcameraposition =
    //     CameraPosition(target: LatLng(p.latitude, p.longitude), zoom: 13.55);
  }

  @override
  initState() {
    getCurrentLocation().then((value) => null);

    createMarkers();
  }

  Future<Uint8List> getBytesFromAssets(String path, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  late final Uint8List user_marker;
  late final Uint8List accidentlocation_marker;
  late final Uint8List ambulance_marker;
  createMarkers() async {
    user_marker = await getBytesFromAssets("assets/images/respcar1.png", 150);
    accidentlocation_marker =
        await getBytesFromAssets("assets/images/Accident.png", 150);
    ambulance_marker =
        await getBytesFromAssets("assets/images/ambulance.png", 150);
  }

  Completer<GoogleMapController> _controller = Completer();

  var i_latlong = LatLng(0.0, 0.0).obs;
  var f_latlong = LatLng(0.0, 0.0).obs;
  var tap = 0.obs;
  _MarkAsSafe() async {
    var response = await http.post(
      Uri.parse(MyUrl.Url + "/MarkAsSafe?nid=${dash_controller1.nid}"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar("Notification Status:", "Marked As Safe Now....",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
    }

    Navigator.of(context).pop();
  }

  _GetVictimResponders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var responderstrack = List<ResponderLocationTrack>.empty().obs;
    var unum = prefs.getString("Phone_Number");
    List<Marker> _list = [];
    List<Polyline> _polylinelst = [];
    // MyTimer() async {
    // final periodictimer =
    //     Timer.periodic(const Duration(seconds: 2), (timer) async {
    while (true) {
      var _responders_coordinates = await http.get(Uri.parse(MyUrl.Url +
          "/GetCoordinatesofResonder?victim_phone=$unum&&nid=${dash_controller1.nid}"));
      if (_responders_coordinates.statusCode == 200) {
        print("Returned Body=${_responders_coordinates.body}");
        Iterable itr = jsonDecode(_responders_coordinates.body);
        responderstrack.value =
            itr.map((e) => ResponderLocationTrack.fromMap(e)).toList();
        List<LatLng> respondertrackpoint = [];
        //  if (itrchecker < responderstrack.length) {
        for (int i = 0; i < responderstrack.length; i++) {
          LatLng lng1 =
              LatLng(responderstrack[i].latitude, responderstrack[i].longitude);
          respondertrackpoint.add(lng1);
        }
        for (int i = 0; i < responderstrack.length; i++) {
          _list.add(Marker(
              markerId: MarkerId("$i a"),
              icon: BitmapDescriptor.fromBytes(user_marker),
              position: LatLng(
                  responderstrack[i].latitude, responderstrack[i].longitude),
              infoWindow: InfoWindow(title: responderstrack[i].cname)));
          _polylinelst.add(Polyline(
              width: 6,
              color: Colors.green,
              points: respondertrackpoint,

              //  [
              //   LatLng(
              //       responderstrack[i].latitude, responderstrack[i].longitude),
              //   LatLng(accidenttrack[accidenttrack.length - 1].latitude,
              //       accidenttrack[accidenttrack.length - 1].longitude)
              // ],
              polylineId: PolylineId(responderstrack[i].cphno + "a")));

          markers.addAll(_list);
          polylines.addAll(_polylinelst);
        }
      }
      await Future.delayed(Duration(seconds: 2));
    }
    // });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Obx(
          () => GoogleMap(
            onTap: (argument) async {
              if (threshold.value > 30) {
                if (tap.value == 0) {
                  tap.value++;

                  await dash_controller1.CalcSpeed();
                  n_lat.value = argument.latitude;
                  n_long.value = argument.longitude;
                  dash_controller1.Save_Notification();
                  _GetVictimResponders();
                } else {
                  ambulance_flag.value = true;
                  a_lat.value = argument.latitude;
                  a_long.value = argument.longitude;
                  dash_controller1.Update_AccidentLocation();
                }
                tap.value++;
              }
              if (timeInterval.value == 0) {
                start_lat.value = argument.latitude;
                start_long.value = argument.longitude;
                i_latlong.value = LatLng(argument.latitude, argument.longitude);
              } else {
                if (timeInterval.value % 2 != 0) {
                  f_latlong.value =
                      LatLng(argument.latitude, argument.longitude);
                } else {
                  i_latlong.value =
                      LatLng(argument.latitude, argument.longitude);
                }
              }
              i.value++;

              timeInterval.value++;

              markers.add(
                threshold.value < 30
                    ? Marker(
                        markerId: MarkerId("${timeInterval.value}"),
                        icon: BitmapDescriptor.fromBytes(user_marker),
                        position: LatLng(argument.latitude, argument.longitude),
                        infoWindow:
                            InfoWindow(title: "${dash_controller1.Username}"))
                    : ambulance_flag.value
                        ? Marker(
                            markerId: MarkerId("${i.value}"),
                            icon: BitmapDescriptor.fromBytes(ambulance_marker),
                            position:
                                LatLng(argument.latitude, argument.longitude),
                            infoWindow: InfoWindow(
                                title:
                                    " Victim =>${dash_controller1.Username}"))
                        : Marker(
                            markerId: MarkerId("${i.value}"),
                            icon: BitmapDescriptor.fromBytes(
                                accidentlocation_marker),
                            position:
                                LatLng(argument.latitude, argument.longitude),
                            infoWindow: InfoWindow(
                                title:
                                    " Victim =>${dash_controller1.Username}")),
              );
              if (timeInterval.value > 1)
                polylines.add(Polyline(
                    width: 6,
                    color: threshold.value < 30 ? Colors.green : Colors.red,
                    points: [i_latlong.value, f_latlong.value],
                    polylineId: PolylineId("{$timeInterval.value}")));
            },
            polylines: Set<Polyline>.of(polylines.value),
            initialCameraPosition: initialcameraposition,
            onMapCreated: (GoogleMapController controller) async {
              // mapController.value = controller;
              // mapController?.animateCamera(
              //     CameraUpdate.newCameraPosition(
              //         CameraPosition(target: newlatlong.value, zoom: 14)
              //         //17 is new zoom level
              //         ));
              _controller.complete(controller);
              GoogleMapController cnt = await _controller.future;
              cnt.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(clat.value, clong.value), zoom: 14)));
              setState(() {});
            },
            markers: Set<Marker>.of(markers.value),
          ),
        ),
        Obx(() => Positioned(
              top: 80,
              left: 10,
              child: dash_controller1.canmarksafe.value
                  ? SliderButton(
                      baseColor: Color.fromARGB(255, 161, 31, 31),
                      backgroundColor: Color.fromARGB(255, 252, 197, 197),
                      highlightedColor: Color.fromARGB(255, 255, 120, 58),
                      buttonColor: Color.fromARGB(255, 255, 53, 3),
                      vibrationFlag: true,
                      height: 60,
                      width: 190,
                      action: () {
                        _MarkAsSafe();
                      },
                      label: const Text(
                        "Mark As Safe",
                        style: TextStyle(
                            color: Color(0xff4a4a4a),
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      icon: Icon(
                        Icons.accessible,
                        size: 44,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ))
                  : Container(),
            )),
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
    );
  }
}
