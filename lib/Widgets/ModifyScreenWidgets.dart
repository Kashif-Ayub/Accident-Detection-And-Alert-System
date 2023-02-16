import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Constant.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';
import 'package:http/http.dart' as http;

Widget HondaCivicWireframe(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Image.asset('assets/images/honda.png'),
        ),
      ),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.065,
          left: MediaQuery.of(context).size.width * 0.4 + 22,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fbumper;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fbumper = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.144,
          left: MediaQuery.of(context).size.width * 0.3,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft1;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft1 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.144,
          left: MediaQuery.of(context).size.width * 0.636,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft2;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft2 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.142,
          left: MediaQuery.of(context).size.width * 0.4,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.engine;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.engine = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 40,
              width: 70,
              child: Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.252,
          left: MediaQuery.of(context).size.width * 0.235,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft3;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft3 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          left: MediaQuery.of(context).size.width * 0.3,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft4;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft4 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          left: MediaQuery.of(context).size.width * 0.45,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft5;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft5 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          left: MediaQuery.of(context).size.width * 0.64,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft6;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft6 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.252,
          left: MediaQuery.of(context).size.width * 0.7,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft7;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft7 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.36,
          left: MediaQuery.of(context).size.width * 0.7,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.doors.toDouble();
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.doors = bpval.value.toInt();
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

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

      Positioned(
          top: MediaQuery.of(context).size.height * 0.69,
          left: MediaQuery.of(context).size.width * 0.47,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rbumper;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rbumper = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: MediaQuery.of(context).size.width * 0.29,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft1;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft1 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: MediaQuery.of(context).size.width * 0.66,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft2;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft2 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
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
            action: () async {
              await Warning();
            },
            label: const Text(
              "Save Changes",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.5),
            ),
            icon: const Icon(
              Icons.published_with_changes,
              size: 44,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      )
    ],
  );
}

Widget CorollaWireframe(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Image.asset('assets/images/corolla.jpg'),
        ),
      ),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.064,
          left: MediaQuery.of(context).size.width * 0.464,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fbumper;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fbumper = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: MediaQuery.of(context).size.width * 0.3,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft1;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft1 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: MediaQuery.of(context).size.width * 0.61,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft2;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft2 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: MediaQuery.of(context).size.width * 0.396,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.engine;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.engine = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 40,
              width: 70,
              child: Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.18,
          left: MediaQuery.of(context).size.width * 0.22,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft3;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft3 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.19,
          left: MediaQuery.of(context).size.width * 0.32,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft4;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft4 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.19,
          left: MediaQuery.of(context).size.width * 0.6,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft5;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft5 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.18,
          left: MediaQuery.of(context).size.width * 0.69,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft6;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft6 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

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

      Positioned(
          top: MediaQuery.of(context).size.height * 0.69,
          left: MediaQuery.of(context).size.width * 0.46,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rbumper;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rbumper = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.66,
          left: MediaQuery.of(context).size.width * 0.3,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft1;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft1 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.66,
          left: MediaQuery.of(context).size.width * 0.62,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft2;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft2 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: MediaQuery.of(context).size.width * 0.3,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft3;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft3 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: MediaQuery.of(context).size.width * 0.62,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft4;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft4 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.61,
          left: MediaQuery.of(context).size.width * 0.24,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft5;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft5 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.61,
          left: MediaQuery.of(context).size.width * 0.69,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft6;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft6 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.69,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.doors.toDouble();
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.doors = bpval.value.toInt();
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
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
            action: () async {
              await Warning();
            },
            label: const Text(
              "Save Changes",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.5),
            ),
            icon: const Icon(
              Icons.published_with_changes,
              size: 44,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      )
    ],
  );
}

Widget AltoWireframe(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Image.asset('assets/images/alto.jpg'),
        ),
      ),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.11,
          left: MediaQuery.of(context).size.width * 0.46,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fbumper;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fbumper = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.163,
          left: MediaQuery.of(context).size.width * 0.25,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft1;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft1 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: MediaQuery.of(context).size.width * 0.32,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft2;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft2 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.145,
          left: MediaQuery.of(context).size.width * 0.397,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.engine;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.engine = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 40,
              width: 70,
              child: Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: MediaQuery.of(context).size.width * 0.6,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft3;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft3 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.163,
          left: MediaQuery.of(context).size.width * 0.662,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft4;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft4 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.16,
          left: MediaQuery.of(context).size.width * 0.32,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft5;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft5 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.16,
          left: MediaQuery.of(context).size.width * 0.6,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft6;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft6 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          left: MediaQuery.of(context).size.width * 0.2255,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft7;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft7 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.19,
          left: MediaQuery.of(context).size.width * 0.32,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft8;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft8 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.19,
          left: MediaQuery.of(context).size.width * 0.6,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft9;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft9 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          left: MediaQuery.of(context).size.width * 0.69,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft10;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft10 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

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
      //

      Positioned(
          top: MediaQuery.of(context).size.height * 0.656,
          left: MediaQuery.of(context).size.width * 0.464,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rbumper;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rbumper = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.61,
          left: MediaQuery.of(context).size.width * 0.27,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft1;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft1 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.61,
          left: MediaQuery.of(context).size.width * 0.65,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft2;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft2 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.38,
          left: MediaQuery.of(context).size.width * 0.68,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.doors.toDouble();
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.doors = bpval.value.toInt();
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
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
            action: () async {
              await Warning();
            },
            label: const Text(
              "Save Changes",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.5),
            ),
            icon: const Icon(
              Icons.published_with_changes,
              size: 44,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      )
    ],
  );
}

Widget VitzWireframe(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Center(
          child: Image.asset('assets/images/vitz.jpg'),
        ),
      ),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.098,
          left: MediaQuery.of(context).size.width * 0.45,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fbumper;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fbumper = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.148,
          left: MediaQuery.of(context).size.width * 0.3,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft1;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft1 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.145,
          left: MediaQuery.of(context).size.width * 0.38,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.engine;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.engine = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 40,
              width: 70,
              child: Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.147,
          left: MediaQuery.of(context).size.width * 0.6,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft2;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft2 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.19,
          left: MediaQuery.of(context).size.width * 0.21,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft3;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft3 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.width * 0.3,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft4;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft4 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.width * 0.6,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft5;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft5 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.19,
          left: MediaQuery.of(context).size.width * 0.68,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.fleft6;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.fleft6 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

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

      Positioned(
          top: MediaQuery.of(context).size.height * 0.66,
          left: MediaQuery.of(context).size.width * 0.45,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rbumper;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rbumper = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),

      Positioned(
          top: MediaQuery.of(context).size.height * 0.605,
          left: MediaQuery.of(context).size.width * 0.21,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft1;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft1 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: MediaQuery.of(context).size.width * 0.28,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft2;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft2 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.62,
          left: MediaQuery.of(context).size.width * 0.61,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft3;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft3 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.605,
          left: MediaQuery.of(context).size.width * 0.68,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.rleft4;
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.rleft4 = bpval.value;
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          left: MediaQuery.of(context).size.width * 0.68,
          child: InkWell(
            onTap: () async {
              bpval.value = wireframe.value.doors.toDouble();
              modifytxt.text = bpval.value.toString();
              await UpdateBucklePoint();
              if (modifyflag == true) {
                wireframe.value.doors = bpval.value.toInt();
                modifyflag = false;
              }
            },
            child: SizedBox(
              height: 27,
              width: 27,
              child: Card(
                color: Colors.red,
                shape: CircleBorder(),
              ),
            ),
          )),
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
            action: () async {
              await Warning();
            },
            label: const Text(
              "Save Changes",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.5),
            ),
            icon: const Icon(
              Icons.published_with_changes,
              size: 44,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      )
    ],
  );
}

Future<dynamic> Warning() {
  return showDialog(
      barrierDismissible: false,
      context: Get.context as BuildContext,
      builder: (cnt) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 170,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 37,
                      ),
                      Text(
                        "Are you sure you want to update the wireframe this can cause miscalculation of force on cabin?",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          TextButton(
                              onPressed: () {
                                _ModifyWireFrame();
                                Get.back();
                              },
                              child: const Text(
                                "Yes",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50,
                  child: Icon(
                    Icons.warning_amber,
                    size: 50,
                    color: Colors.red,
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

TextEditingController modifytxt = TextEditingController();
Future<dynamic> UpdateBucklePoint() {
  return showDialog(
      barrierDismissible: false,
      context: Get.context as BuildContext,
      builder: (cnt) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 230,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Modify Bucklepoint Value",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                if (bpval.value > 0) {
                                  bpval.value--;
                                  modifytxt.text = bpval.value.toString();
                                }
                              },
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 243, 33, 33),
                                          Color.fromARGB(255, 255, 153, 0)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 50,
                                          color: Color(0xffEEEEEE)),
                                    ]),
                                child: Center(
                                    child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                              ),
                            ),
                            Container(
                              width: 90,
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 1),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 50,
                                        color: Color(0xffEEEEEE)),
                                  ]),
                              alignment: Alignment.center,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: modifytxt,
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return "Required Fill out the Fields";
                                  }
                                  return null;
                                },
                                cursorColor: const Color(0xffF5591f),
                                decoration: const InputDecoration(
                                  // icon: Icon(
                                  //   Icons.edit_note_rounded,
                                  //   color: Color(0xffF5591f),
                                  // ),

                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                keyboardType: TextInputType.none,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //  bpval.value++;

                                bpval.value++;
                                modifytxt.text = bpval.value.toString();
                              },
                              child: Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 243, 33, 33),
                                          Color.fromARGB(255, 255, 153, 0)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 50,
                                          color: Color(0xffEEEEEE)),
                                    ]),
                                child: Center(
                                    child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                              ),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          TextButton(
                              onPressed: () {
                                modifyflag = true;
                                Get.back();
                              },
                              child: const Text(
                                "Modify",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50,
                  child: Icon(
                    Icons.mode_edit,
                    size: 50,
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

_ModifyWireFrame() async {
  try {
    var response = await http.post(Uri.parse(MyUrl.Url + "/UpdateWireFrame"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(wireframe.toJson()));
    if (response.statusCode == 200) {
      Get.snackbar(
        "$userCar",
        "WireFrame Modified Successfully",
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        backgroundColor: const Color(0xFFFFDCD1),
      );
    }
  } catch (ex) {
    print(ex);
  }
}
