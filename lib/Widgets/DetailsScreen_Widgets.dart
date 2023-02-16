import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Constant.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Google_Map_Screen.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:slider_button/slider_button.dart';

import '../Controllers/Details_Screen_Controller.dart';

Widget HondaSimulation(
    {required BuildContext context, required DetailsController cont}) {
  return Stack(
    children: [
      Center(
        child: RippleAnimation(
            repeat: true,
            color: Color.fromARGB(255, 255, 112, 69),
            minRadius: 60,
            ripplesCount: 30,
            child: Container()),
      ),

      Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Image.asset('assets/images/honda.png'),
        ),
      ),

      Obx(() => Positioned(
            top: MediaQuery.of(context).size.height * 0.3 + 18,
            left: MediaQuery.of(context).size.width * 0.3 + 15,
            child: SizedBox(
              height: 20,
              width: 20,
              child: Card(
                color: cont.fbumperL.value,
                shape: CircleBorder(),
              ),
            ),
          )),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: MediaQuery.of(context).size.width * 0.4 + 28,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fbumperM.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.3 + 18,
          left: MediaQuery.of(context).size.width * 0.6 + 5,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fbumperR.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.3 + 32,
          left: MediaQuery.of(context).size.width * 0.4 - 7,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft1.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.3 + 32,
          left: MediaQuery.of(context).size.width * 0.6 - 8,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft2.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.339,
          left: MediaQuery.of(context).size.width * 0.43,
          child: SizedBox(
            height: 30,
            width: 50,
            child: Card(
              color: cont.engine.value,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.34,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft3.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.39 - 3,
          left: MediaQuery.of(context).size.width * 0.39 - 5,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft4.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.39 - 3,
          left: MediaQuery.of(context).size.width * 0.47,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft5.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.39 - 3,
          left: MediaQuery.of(context).size.width * 0.57 + 2,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft6.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.62,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft7.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.269,
          left: MediaQuery.of(context).size.width * 0.35,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowL.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowM.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.269,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowR.value,
              )))),
      //   Positioned(
      //     top: MediaQuery.of(context).size.height * 0.269,
      //     left: MediaQuery.of(context).size.width * 0.58,
      //     child: Transform.rotate(
      //       angle: 180 * math.pi / 49,
      //       child: SizedBox(
      //           height: 40,
      //           width: 20,
      //           child: Icon(
      //             Icons.arrow_downward,
      //             size: 30,
      //           )),
      //     ),
      //   )
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.frarrow.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.flarrow.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.door2.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.53,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.door4.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.door1.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.53,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.door3.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.35,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowL.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowM.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowR.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.67,
          left: MediaQuery.of(context).size.width * 0.37,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperL.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.67,
          left: MediaQuery.of(context).size.width * 0.47,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperM.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.67,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperR.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.37,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft1.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.28,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: cont.rlarrow.value,
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft2.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: cont.rrarrow.value,
            ),
          ))),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.03,
        left: MediaQuery.of(context).size.width * 0.02,
        child: SizedBox(
          height: 130,
          width: 350,
          child: Card(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text("FORCE STATS",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("HIT FORCE:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("FORCE ON CABIN:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("BUCKLE POINT NAME:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("ABSORBANCE CAPACITY:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("FORCE ABSORBED:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Obx(
                              () => Text("${Total_Force.value}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text("${ForceOnCabin.value}N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.bucklepoints[cont.index.value].bucklepoint}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.bucklepoints[cont.index.value].bucklepointabs} %",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text("${cont.HitForce.value} N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )
                      ]),
                ],
              ),
            )),
            elevation: 30,
            color: Colors.teal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      Positioned(
        bottom: 30,
        left: 20,
        child: SliderButton(
            baseColor: Color.fromARGB(255, 161, 31, 31),
            backgroundColor: Color.fromARGB(255, 252, 197, 197),
            highlightedColor: Color.fromARGB(255, 255, 120, 58),
            buttonColor: Color.fromARGB(255, 255, 53, 3),
            vibrationFlag: true,
            height: 60,
            width: 180,
            action: () {
              Get.to(() => const Google_Map());
            },
            label: const Text(
              "NAVIGATE",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            icon: const Icon(
              Icons.location_history,
              size: 44,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      )
    ],
  );
}

Widget CorollaSimulation(
    {required BuildContext context, required DetailsController cont}) {
  return Stack(
    children: [
      Center(
        child: RippleAnimation(
            repeat: true,
            color: Color.fromARGB(255, 255, 112, 69),
            minRadius: 60,
            ripplesCount: 30,
            child: Container()),
      ),

      Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Image.asset('assets/images/corolla.jpg'),
        ),
      ),

      Obx(() => Positioned(
            top: MediaQuery.of(context).size.height * 0.32,
            left: MediaQuery.of(context).size.width * 0.3 + 15,
            child: SizedBox(
              height: 20,
              width: 20,
              child: Card(
                color: cont.fbumperL.value,
                shape: CircleBorder(),
              ),
            ),
          )),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fbumperM.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.32,
          left: MediaQuery.of(context).size.width * 0.6,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fbumperR.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.33,
          left: MediaQuery.of(context).size.width * 0.4 - 7,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft1.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.33,
          left: MediaQuery.of(context).size.width * 0.6 - 8,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft2.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.33,
          left: MediaQuery.of(context).size.width * 0.43,
          child: SizedBox(
            height: 30,
            width: 50,
            child: Card(
              color: cont.engine.value,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.36,
          left: MediaQuery.of(context).size.width * 0.33,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft3.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.37,
          left: MediaQuery.of(context).size.width * 0.39 - 5,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft4.value,
              shape: CircleBorder(),
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.37,
          left: MediaQuery.of(context).size.width * 0.57 + 2,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft5.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.355,
          left: MediaQuery.of(context).size.width * 0.615,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft6.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.269,
          left: MediaQuery.of(context).size.width * 0.35,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowL.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowM.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.269,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowR.value,
              )))),
      //   Positioned(
      //     top: MediaQuery.of(context).size.height * 0.269,
      //     left: MediaQuery.of(context).size.width * 0.58,
      //     child: Transform.rotate(
      //       angle: 180 * math.pi / 49,
      //       child: SizedBox(
      //           height: 40,
      //           width: 20,
      //           child: Icon(
      //             Icons.arrow_downward,
      //             size: 30,
      //           )),
      //     ),
      //   )
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.frarrow.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.flarrow.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.door2.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.53,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.door4.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.door1.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.53,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.door3.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.35,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowL.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowM.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowR.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.672,
          left: MediaQuery.of(context).size.width * 0.37,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperL.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.672,
          left: MediaQuery.of(context).size.width * 0.47,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperM.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.672,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperR.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.657,
          left: MediaQuery.of(context).size.width * 0.38,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.rleft1.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.28,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: cont.rlarrow.value,
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.657,
          left: MediaQuery.of(context).size.width * 0.568,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.rleft2.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.38,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.rleft3.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.568,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.rleft4.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.634,
          left: MediaQuery.of(context).size.width * 0.33,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft5.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.634,
          left: MediaQuery.of(context).size.width * 0.6,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft6.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: cont.rrarrow.value,
            ),
          ))),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.03,
        left: MediaQuery.of(context).size.width * 0.02,
        child: SizedBox(
          height: 130,
          width: 350,
          child: Card(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text("FORCE STATS",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("HIT FORCE:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("FORCE ON CABIN:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("BUCKLE POINT NAME:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("ABSORBANCE CAPACITY:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("FORCE ABSORBED:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Obx(
                              () => Text(
                                  "${Total_Force.value.toStringAsFixed(2)} N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${ForceOnCabin.value.toStringAsFixed(2)} N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.bucklepoints[cont.index.value].bucklepoint}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.bucklepoints[cont.index.value].bucklepointabs} %",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.HitForce.value.toStringAsFixed(2)} N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )
                      ]),
                ],
              ),
            )),
            elevation: 30,
            color: Colors.teal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      Positioned(
        bottom: 30,
        left: 20,
        child: SliderButton(
            baseColor: Color.fromARGB(255, 161, 31, 31),
            backgroundColor: Color.fromARGB(255, 252, 197, 197),
            highlightedColor: Color.fromARGB(255, 255, 120, 58),
            buttonColor: Color.fromARGB(255, 255, 53, 3),
            vibrationFlag: true,
            height: 60,
            width: 180,
            action: () {
              Get.to(() => const Google_Map());
            },
            label: const Text(
              "NAVIGATE",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            icon: const Icon(
              Icons.location_history,
              size: 44,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      )
    ],
  );
}

Widget AltoSimulation(
    {required BuildContext context, required DetailsController cont}) {
  return Stack(
    children: [
      Center(
        child: RippleAnimation(
            repeat: true,
            color: Color.fromARGB(255, 255, 112, 69),
            minRadius: 60,
            ripplesCount: 30,
            child: Container()),
      ),

      Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Image.asset('assets/images/alto.jpg'),
        ),
      ),

      Obx(() => Positioned(
            top: MediaQuery.of(context).size.height * 0.31,
            left: MediaQuery.of(context).size.width * 0.3 + 15,
            child: SizedBox(
              height: 20,
              width: 20,
              child: Card(
                color: cont.fbumperL.value,
                shape: CircleBorder(),
              ),
            ),
          )),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.294,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fbumperM.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.31,
          left: MediaQuery.of(context).size.width * 0.6,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fbumperR.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.33,
          left: MediaQuery.of(context).size.width * 0.33,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft1.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.32,
          left: MediaQuery.of(context).size.width * 0.38,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft2.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.32,
          left: MediaQuery.of(context).size.width * 0.43,
          child: SizedBox(
            height: 30,
            width: 50,
            child: Card(
              color: cont.engine.value,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.32,
          left: MediaQuery.of(context).size.width * 0.57,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft3.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.33,
          left: MediaQuery.of(context).size.width * 0.619,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft4.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.339,
          left: MediaQuery.of(context).size.width * 0.38,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft5.value,
              shape: CircleBorder(),
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.339,
          left: MediaQuery.of(context).size.width * 0.57,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft6.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.365,
          left: MediaQuery.of(context).size.width * 0.31,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft7.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.355,
          left: MediaQuery.of(context).size.width * 0.38,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft8.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.355,
          left: MediaQuery.of(context).size.width * 0.57,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft9.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.363,
          left: MediaQuery.of(context).size.width * 0.633,
          child: SizedBox(
            height: 17,
            width: 17,
            child: Card(
              color: cont.fleft10.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.269,
          left: MediaQuery.of(context).size.width * 0.35,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowL.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowM.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.269,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowR.value,
              )))),
      //   Positioned(
      //     top: MediaQuery.of(context).size.height * 0.269,
      //     left: MediaQuery.of(context).size.width * 0.58,
      //     child: Transform.rotate(
      //       angle: 180 * math.pi / 49,
      //       child: SizedBox(
      //           height: 40,
      //           width: 20,
      //           child: Icon(
      //             Icons.arrow_downward,
      //             size: 30,
      //           )),
      //     ),
      //   )
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.657,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.frarrow.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.257,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.flarrow.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.door2arr.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.53,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.door4arr.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.door1arr.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.53,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.door3arr.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.35,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowL.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowM.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowR.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.675,
          left: MediaQuery.of(context).size.width * 0.32,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperL.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.679,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperM.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.675,
          left: MediaQuery.of(context).size.width * 0.62,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperR.value,
              shape: CircleBorder(),
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.257,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: cont.rlarrow.value,
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.642,
          left: MediaQuery.of(context).size.width * 0.334,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft1.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.642,
          left: MediaQuery.of(context).size.width * 0.6,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft2.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.655,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: cont.rrarrow.value,
            ),
          ))),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.03,
        left: MediaQuery.of(context).size.width * 0.02,
        child: SizedBox(
          height: 130,
          width: 350,
          child: Card(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text("FORCE STATS",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("HIT FORCE:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("FORCE ON CABIN:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("BUCKLE POINT NAME:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("ABSORBANCE CAPACITY:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("FORCE ABSORBED:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Obx(
                              () => Text(
                                  "${Total_Force.value.toStringAsFixed(2)} N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${ForceOnCabin.value.toStringAsFixed(2)}N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.bucklepoints[cont.index.value].bucklepoint}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.bucklepoints[cont.index.value].bucklepointabs} %",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.HitForce.value.toStringAsFixed(2)} N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )
                      ]),
                ],
              ),
            )),
            elevation: 30,
            color: Colors.teal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      Positioned(
        bottom: 30,
        left: 20,
        child: SliderButton(
            baseColor: Color.fromARGB(255, 161, 31, 31),
            backgroundColor: Color.fromARGB(255, 252, 197, 197),
            highlightedColor: Color.fromARGB(255, 255, 120, 58),
            buttonColor: Color.fromARGB(255, 255, 53, 3),
            vibrationFlag: true,
            height: 60,
            width: 180,
            action: () {
              Get.to(() => const Google_Map());
            },
            label: const Text(
              "NAVIGATE",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            icon: const Icon(
              Icons.location_history,
              size: 44,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      )
    ],
  );
}

Widget VitzSimulation(
    {required BuildContext context, required DetailsController cont}) {
  return Stack(
    children: [
      Center(
        child: RippleAnimation(
            repeat: true,
            color: Color.fromARGB(255, 255, 112, 69),
            minRadius: 60,
            ripplesCount: 30,
            child: Container()),
      ),

      Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Image.asset('assets/images/vitz.jpg'),
        ),
      ),

      Obx(() => Positioned(
            top: MediaQuery.of(context).size.height * 0.31,
            left: MediaQuery.of(context).size.width * 0.3 + 15,
            child: SizedBox(
              height: 20,
              width: 20,
              child: Card(
                color: cont.fbumperL.value,
                shape: CircleBorder(),
              ),
            ),
          )),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.294,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fbumperM.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.31,
          left: MediaQuery.of(context).size.width * 0.6,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fbumperR.value,
              shape: CircleBorder(),
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.325,
          left: MediaQuery.of(context).size.width * 0.38,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft1.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.325,
          left: MediaQuery.of(context).size.width * 0.423,
          child: SizedBox(
            height: 30,
            width: 50,
            child: Card(
              color: cont.engine.value,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.325,
          left: MediaQuery.of(context).size.width * 0.57,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft2.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.31,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft3.value,
              shape: CircleBorder(),
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.38,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft4.value,
              shape: CircleBorder(),
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.57,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft5.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.619,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.fleft6.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.269,
          left: MediaQuery.of(context).size.width * 0.35,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowL.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowM.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.269,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_downward,
                size: 30,
                color: cont.fbarrowR.value,
              )))),
      //   Positioned(
      //     top: MediaQuery.of(context).size.height * 0.269,
      //     left: MediaQuery.of(context).size.width * 0.58,
      //     child: Transform.rotate(
      //       angle: 180 * math.pi / 49,
      //       child: SizedBox(
      //           height: 40,
      //           width: 20,
      //           child: Icon(
      //             Icons.arrow_downward,
      //             size: 30,
      //           )),
      //     ),
      //   )
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.657,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.frarrow.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.257,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.flarrow.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.door2arr.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.53,
          left: MediaQuery.of(context).size.width * 0.27,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: cont.door4arr.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.door1arr.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.53,
          left: MediaQuery.of(context).size.width * 0.65,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: cont.door3arr.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.35,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowL.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowM.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
              height: 40,
              width: 20,
              child: Icon(
                Icons.arrow_upward,
                size: 30,
                color: cont.rbarrowR.value,
              )))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.671,
          left: MediaQuery.of(context).size.width * 0.32,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperL.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.675,
          left: MediaQuery.of(context).size.width * 0.46,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperM.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.671,
          left: MediaQuery.of(context).size.width * 0.62,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rbumperR.value,
              shape: CircleBorder(),
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.24,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: cont.rlarrow.value,
            ),
          ))),

      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.644,
          left: MediaQuery.of(context).size.width * 0.3,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft1.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.647,
          left: MediaQuery.of(context).size.width * 0.34,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft2.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.647,
          left: MediaQuery.of(context).size.width * 0.58,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft3.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.644,
          left: MediaQuery.of(context).size.width * 0.626,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Card(
              color: cont.rleft4.value,
              shape: CircleBorder(),
            ),
          ))),
      Obx(() => Positioned(
          top: MediaQuery.of(context).size.height * 0.64,
          left: MediaQuery.of(context).size.width * 0.66,
          child: SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: cont.rrarrow.value,
            ),
          ))),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.03,
        left: MediaQuery.of(context).size.width * 0.02,
        child: SizedBox(
          height: 130,
          width: 350,
          child: Card(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text("FORCE STATS",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("HIT FORCE:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("FORCE ON CABIN:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("BUCKLE POINT NAME:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("ABSORBANCE CAPACITY:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text("FORCE ABSORBED:",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Obx(
                              () => Text(
                                  "${Total_Force.value.toStringAsFixed(2)} N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text("${ForceOnCabin.value}N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.bucklepoints[cont.index.value].bucklepoint}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.bucklepoints[cont.index.value].bucklepointabs} %",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Obx(
                              () => Text(
                                  "${cont.HitForce.value.toStringAsFixed(2)} N",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )
                      ]),
                ],
              ),
            )),
            elevation: 30,
            color: Colors.teal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      Positioned(
        bottom: 30,
        left: 20,
        child: SliderButton(
            baseColor: Color.fromARGB(255, 161, 31, 31),
            backgroundColor: Color.fromARGB(255, 252, 197, 197),
            highlightedColor: Color.fromARGB(255, 255, 120, 58),
            buttonColor: Color.fromARGB(255, 255, 53, 3),
            vibrationFlag: true,
            height: 60,
            width: 180,
            action: () {
              Get.to(() => const Google_Map());
            },
            label: const Text(
              "NAVIGATE",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            icon: const Icon(
              Icons.location_history,
              size: 44,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      )
    ],
  );
}
