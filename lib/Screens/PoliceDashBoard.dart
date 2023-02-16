import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Animation/Fade_Animation_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/AddContacts_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Contacts_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Dashboard_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Google_Maps_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/History.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/HistorybyDateScreen.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/ModifyScreen.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Splash_Screen.dart';
import 'package:fyp_accident_detection_and_alert_system/Widgets/Dashboard_Widgets.dart';
import 'package:get/get.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import '../Controllers/Constant.dart';
import '../Controllers/PoliceDashboardCotroller.dart';
import 'BottomSheet.dart';
import 'Contacts_Screen.dart';
import 'Details_Screen.dart';
import 'PoliceAllHistory.dart';

class PoliceDashBoard extends StatefulWidget {
  const PoliceDashBoard({Key? key}) : super(key: key);

  @override
  State<PoliceDashBoard> createState() => _PoliceDashBoardState();
}

class _PoliceDashBoardState extends State<PoliceDashBoard> {
  final pdash_controller = Get.put(PoliceDashBoardController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.maybeOf(context)!.size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences _prefs = await SharedPreferences.getInstance();
              await _prefs.clear();
              pdash_controller.getalerts.value = false;
              Get.delete<PoliceDashBoardController>();
              Get.delete<DashBoard_Screen_Controller>();
              Get.delete<AddContacts_Controller>();
              Get.delete<Contacts_Controller>();
              Get.delete<Google_Map_ControllerGetx>();

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: ((context) => const SplashScreen())));
            },
            icon: const Icon(Icons.logout),
            splashColor: const Color.fromARGB(255, 175, 131, 0),
          )
        ],
        leading: CircleAvatar(
          child: Image.asset("assets/images/Logo.png"),
          backgroundColor: const Color.fromARGB(255, 255, 200, 2),
        ),
        title: Text(
          "POLICE",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFC6C37),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Obx(() => dash_controller.connected.value == true
              //     ? Row(
              //         children: [
              //           Icon(
              //             Icons.person,
              //             color: Colors.green,
              //           ),
              //           RippleAnimation(
              //             repeat: true,
              //             color: Color.fromARGB(255, 165, 223, 100),
              //             child: Text(
              //               "Online",
              //               style: TextStyle(
              //                   fontStyle: FontStyle.italic,
              //                   color: Color.fromARGB(255, 9, 121, 67)),
              //             ),
              //           ),
              //         ],
              //       )
              //     : Row(
              //         children: [
              //           Icon(Icons.person, color: Colors.red),
              //           RippleAnimation(
              //             repeat: true,
              //             color: Color.fromARGB(255, 230, 161, 157),
              //             child: Text(
              //               "Offline",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontStyle: FontStyle.italic,
              //                   color: Color.fromARGB(255, 211, 0, 0)),
              //             ),
              //           ),
              //         ],
              //       )),
              // // Obx(
              //   () => dash_controller.is_started.value == false
              //       ?
              //        Container(
              //           child: Column(
              //             children: [
              //               SizedBox(
              //                 height: 60,
              //                 child: MyFadeIn(
              //                     delaymseconds: 1000,
              //                     child: Container(
              //                       height: 50,
              //                       margin: const EdgeInsets.only(
              //                         left: 20,
              //                         right: 20,
              //                       ),
              //                       padding: const EdgeInsets.only(
              //                           left: 20, right: 20),
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(50),
              //                           color: Colors.grey[200],
              //                           boxShadow: const [
              //                             BoxShadow(
              //                                 offset: Offset(0, 10),
              //                                 blurRadius: 50,
              //                                 color: Color(0xffEEEEEE)),
              //                           ]),
              //                       alignment: Alignment.center,
              //                       child: Obx(() => dash_controller
              //                                   .isloading ==
              //                               false
              //                           ? DropdownButtonFormField(
              //                               value: Selected_val_car.value,
              //                               items: dash_controller.lst.value
              //                                   .map((e) => DropdownMenuItem(
              //                                         child: Text(
              //                                           e.toString(),
              //                                           style: const TextStyle(
              //                                               fontSize: 14,
              //                                               fontWeight:
              //                                                   FontWeight
              //                                                       .bold),
              //                                         ),
              //                                         value: e.toString(),
              //                                       ))
              //                                   .toList(),
              //                               onChanged: (v) {
              //                                 Selected_val_car.value =
              //                                     v as String;
              //                               },
              //                               dropdownColor: const Color.fromARGB(
              //                                   255, 255, 150, 138),
              //                               icon: const Icon(
              //                                 Icons.arrow_drop_down_circle,
              //                                 color: Colors.deepOrange,
              //                               ),
              //                               decoration: const InputDecoration(
              //                                 labelText: "Change Car",
              //                                 labelStyle: TextStyle(
              //                                     color: Colors.deepOrange,
              //                                     fontWeight: FontWeight.bold),
              //                                 icon: Icon(
              //                                   Icons.drive_eta,
              //                                   color: Color(0xffF5591f),
              //                                 ),
              //                                 enabledBorder: InputBorder.none,
              //                                 focusedBorder: InputBorder.none,
              //                               ),
              //                             )
              //                           : Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.center,
              //                               children: const [
              //                                 CircularProgressIndicator(
              //                                   color: Colors.deepOrange,
              //                                 ),
              //                                 SizedBox(
              //                                   width: 20,
              //                                 ),
              //                                 Text(
              //                                   "Loading Cars...",
              //                                   style: TextStyle(
              //                                       color: Colors.deepOrange,
              //                                       fontWeight: FontWeight.bold,
              //                                       fontSize: 15),
              //                                 )
              //                               ],
              //                             )),
              //                     )),
              //               ),
              //               SizedBox(
              //                 height: 60,
              //                 child: MyFadeIn(
              //                     delaymseconds: 2000,
              //                     child: Container(
              //                       height: 30,
              //                       margin: const EdgeInsets.only(
              //                           left: 70, right: 70, top: 10),
              //                       padding: const EdgeInsets.only(
              //                           left: 20, right: 20),
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(50),
              //                           color: Colors.grey[200],
              //                           boxShadow: const [
              //                             BoxShadow(
              //                                 offset: Offset(0, 10),
              //                                 blurRadius: 50,
              //                                 color: Color(0xffEEEEEE)),
              //                           ]),
              //                       alignment: Alignment.center,
              //                       child: MyElevatedButton(),
              //                       //  Obx(() => DropdownButtonFormField(
              //                       //       value: dash_controller
              //                       //           .Selected_val_seat.value,
              //                       //       items: dash_controller.lsts
              //                       //           .map((e) => DropdownMenuItem(
              //                       //                 child: Text(
              //                       //                   e,
              //                       //                   style: const TextStyle(
              //                       //                       fontSize: 14,
              //                       //                       fontWeight:
              //                       //                           FontWeight.bold),
              //                       //                 ),
              //                       //                 value: e,
              //                       //               ))
              //                       //           .toList(),
              //                       //       onChanged: (v) {
              //                       //         dash_controller.Selected_val_seat
              //                       //             .value = v as String;
              //                       //       },
              //                       //       dropdownColor: const Color.fromARGB(
              //                       //           255, 255, 150, 138),
              //                       //       icon: const Icon(
              //                       //         Icons.arrow_drop_down_circle,
              //                       //         color: Colors.deepOrange,
              //                       //       ),
              //                       //       decoration: const InputDecoration(
              //                       //         labelText: "Change Seat",
              //                       //         labelStyle: TextStyle(
              //                       //             color: Colors.deepOrange,
              //                       //             fontWeight: FontWeight.bold),
              //                       //         icon: Icon(
              //                       //           Icons.chair,
              //                       //           color: Color(0xffF5591f),
              //                       //         ),
              //                       //         enabledBorder: InputBorder.none,
              //                       //         focusedBorder: InputBorder.none,
              //                       //       ),
              //                       //     )),
              //                     )),
              //               ),
              //             ],
              //           ),
              //         )
              //       : MyFadeIn(
              //           delaymseconds: 3000,
              //           child: Container(
              //               margin: const EdgeInsets.only(top: 5),
              //               height: 150,
              //               child: Obx(() => KdGaugeView(
              //                     key: dash_controller.gkey,
              //                     minSpeed: 0,
              //                     maxSpeed: 220,
              //                     speed: dash_controller.speed.value,
              //                     speedTextStyle: const TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 30),
              //                     animate: true,
              //                     duration: const Duration(seconds: 3),
              //                     subDivisionCircleColors: Colors.redAccent,
              //                     divisionCircleColors: Colors.blue,
              //                     baseGaugeColor: Colors.transparent,
              //                     activeGaugeColor: Colors.green,
              //                     inactiveGaugeColor: Colors.grey.shade100,
              //                     // innerCirclePadding: 50.0,
              //                     unitOfMeasurementTextStyle: const TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         color: Colors.black,
              //                         fontSize: 10),

              //                     gaugeWidth: 20.0,
              //                     alertColorArray: const [
              //                       Colors.purpleAccent,
              //                       Colors.yellow,
              //                       Colors.redAccent
              //                     ],

              //                     alertSpeedArray: const [40, 80, 100],
              //                     minMaxTextStyle: const TextStyle(
              //                         fontSize: 10,
              //                         color: Colors.deepOrangeAccent,
              //                         fontWeight: FontWeight.bold),
              //                   ))),
              //         ),
              // ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: height,
                child: GridView.count(
                  childAspectRatio: 1.15,
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 10,
                  primary: false,
                  physics: const ScrollPhysics(),
                  children: [
                    // MyFadeIn(
                    //     delaymseconds: 3000,
                    //     child: InkWell(
                    //       onTap: () {
                    //         if (dash_controller.txt.value != "Stop") {
                    //           dash_controller.ShowMap();
                    //           dash_controller.is_started.value = true;
                    //           dash_controller.txt.value = "Stop";
                    //           dash_controller.colr.value = Colors.red;
                    //           dash_controller.getstartedicon.value =
                    //               Icons.settings_power_rounded;
                    //           // dash_controller.updateSpeed();
                    //           dash_controller.StartAccidentDetection();
                    //           // dash_controller.MyTimer();

                    //           print("started");
                    //         } else {
                    //           dash_controller.getstartedicon.value =
                    //               Icons.play_circle_fill;
                    //           dash_controller.txt.value = "Get Started";
                    //           dash_controller.is_started.value = false;
                    //           dash_controller.colr.value = Colors.deepOrange;

                    //           print("stopped");
                    //         }

                    //         print(dash_controller.is_started.value.toString());
                    //       },
                    //       child: Obx(() => MyCard(
                    //           clr: dash_controller.colr.value,
                    //           icon: dash_controller.getstartedicon.value,
                    //           txt: dash_controller.txt.value,
                    //           height: height)),
                    //     )),
                    // MyFadeIn(
                    //     delaymseconds: 4000,
                    //     child: InkWell(
                    //       onTap: () {
                    //         Get.to(() => Contacts());
                    //       },
                    //       child: MyCard(
                    //           clr: Colors.deepOrange,
                    //           icon: Icons.contact_page,
                    //           txt: "Add Contacts",
                    //           height: height),
                    //     )),
                    // MyFadeIn(
                    //     delaymseconds: 5000,
                    //     child: InkWell(
                    //       onTap: () {
                    //         threshold.value = 31;
                    //         dash_controller.ShowMap();
                    //       },
                    //       child: MyCard(
                    //           clr: Colors.deepOrange,
                    //           icon: Icons.warning_amber_sharp,
                    //           txt: "Send Alert",
                    //           height: height),
                    //     )),
                    // MyFadeIn(
                    //     delaymseconds: 6000,
                    //     child: InkWell(
                    //       onTap: () => Get.to(() => AccidentDetails()),
                    //       child: MyCard(
                    //           clr: Colors.deepOrange,
                    //           icon: Icons.info,
                    //           txt: "Accident Details",
                    //           height: height),
                    //     )),

                    MyFadeIn(
                        delaymseconds: 7000,
                        child: InkWell(
                          onTap: () {
                            pdash_controller.getalerts.value = false;
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (con) => HistoryByDateSreen()));
                            // Get.to(() => const HistoryByDateSreen());
                          },
                          child: MyCard(
                              clr: Colors.deepOrange,
                              icon: Icons.date_range,
                              txt: "History by Date",
                              height: height),
                        )),
                    MyFadeIn(
                        delaymseconds: 8000,
                        child: InkWell(
                          onTap: () {
                            pdash_controller.getalerts.value = false;
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (con) => PoliceHistorySreen()));
                            // Get.back();
                            // Get.to(() => const PoliceHistorySreen());
                          },
                          child: MyCard(
                              clr: Colors.deepOrange,
                              icon: Icons.menu_book,
                              txt: "History",
                              height: height),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// class MyElevatedButton extends StatelessWidget {
//   const MyElevatedButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         var sheetController = showBottomSheet(
//             context: context, builder: (context) => BottomSheetWidget());
//       },
//       style: ElevatedButton.styleFrom(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text("Change Seat",
//               style: TextStyle(
//                   color: Colors.deepOrange,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20)),
//         ],
//       ),
//     );
//   }
// }
