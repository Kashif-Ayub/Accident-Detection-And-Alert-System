import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../Controllers/Dashboard_Screen_Controller.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final DashBoard_Screen_Controller _cont =
      Get.put(DashBoard_Screen_Controller());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      height: (MediaQuery.of(context).size.height / 1.5) + 45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height / 1.5) + 45,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.grey, spreadRadius: 5),
                ]),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Safety Belt:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 30,
                              child: RollingSwitch.icon(
                                height: 50,
                                width: 90,
                                innerSize: 40,
                                onChanged: (bool state) {
                                  _cont.safetybelt.value = state;
                                  print('turned ${(state) ? 'on' : 'off'}');
                                },
                                rollingInfoRight: const RollingIconInfo(
                                    iconColor: Colors.red,
                                    icon: Icons.check,
                                    text: Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.lightGreen),
                                rollingInfoLeft: const RollingIconInfo(
                                  backgroundColor: Colors.red,
                                  iconColor: Colors.deepOrange,
                                  icon: Icons.airline_seat_recline_extra,
                                  text: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Air Bag:",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 30,
                              child: RollingSwitch.icon(
                                height: 50,
                                width: 90,
                                innerSize: 40,
                                onChanged: (bool state) {
                                  _cont.airbag.value = state;
                                  print('turned ${(state) ? 'on' : 'off'}');
                                },
                                rollingInfoRight: const RollingIconInfo(
                                    iconColor: Colors.red,
                                    icon: Icons.check,
                                    text: Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.lightGreen),
                                rollingInfoLeft: const RollingIconInfo(
                                  backgroundColor: Colors.red,
                                  iconColor: Colors.deepOrange,
                                  icon: Icons.airline_seat_flat_angled,
                                  text: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 15,
                ),
                const Center(
                    child: Text(
                  "Select Your Seat",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),

                DecoratedImageArea(),
                //SheetButtonWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DecoratedImageArea extends StatelessWidget {
  final dash_controller = Get.put(DashBoard_Screen_Controller());
  DecoratedImageArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: (MediaQuery.of(context).size.height * 0.58),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/images/seatselect.png",
              height: 400,
            )),
        Obx(() => Positioned(
            left: 105,
            top: 190,
            child: InkWell(
              onTap: () {
                dash_controller.Selected_val_seat.value = "Driving";
                dash_controller.BackRight_seat.value = Colors.transparent;
                dash_controller.BackMiddle_seat.value = Colors.transparent;
                dash_controller.Driving_seat.value =
                    Color.fromARGB(255, 2, 250, 130);
                dash_controller.Front_seat.value = Colors.transparent;
                dash_controller.BackLeft_seat.value = Colors.transparent;
              },
              child: Container(
                color: Colors.transparent,
                height: 68,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 50,
                  color: dash_controller.Driving_seat.value,
                ),
              ),
            ))),
        Obx(() => Positioned(
            right: 100,
            top: 190,
            child: InkWell(
              onTap: () {
                dash_controller.Selected_val_seat.value = "Front";
                dash_controller.BackRight_seat.value = Colors.transparent;
                dash_controller.BackMiddle_seat.value = Colors.transparent;
                dash_controller.Front_seat.value =
                    Color.fromARGB(255, 2, 250, 130);
                dash_controller.Driving_seat.value = Colors.transparent;
                dash_controller.BackLeft_seat.value = Colors.transparent;
              },
              child: Container(
                color: Colors.transparent,
                height: 68,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 50,
                  color: dash_controller.Front_seat.value,
                ),
              ),
            ))),
        Obx(() => Positioned(
            left: 105,
            top: 255,
            child: InkWell(
              onTap: () {
                dash_controller.Selected_val_seat.value = "BackLeft";
                dash_controller.BackRight_seat.value = Colors.transparent;
                dash_controller.BackMiddle_seat.value = Colors.transparent;
                dash_controller.BackLeft_seat.value =
                    Color.fromARGB(255, 2, 250, 130);
                dash_controller.Driving_seat.value = Colors.transparent;
                dash_controller.Front_seat.value = Colors.transparent;
              },
              child: Container(
                color: Colors.transparent,
                height: 68,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 50,
                  color: dash_controller.BackLeft_seat.value,
                ),
              ),
            ))),
        Obx(() => Positioned(
            left: 150,
            top: 255,
            child: InkWell(
              onTap: () {
                dash_controller.Selected_val_seat.value = "BackMiddle";
                dash_controller.BackRight_seat.value = Colors.transparent;
                dash_controller.BackMiddle_seat.value =
                    Color.fromARGB(255, 2, 250, 130);
                dash_controller.BackLeft_seat.value = Colors.transparent;
                dash_controller.Driving_seat.value = Colors.transparent;
                dash_controller.Front_seat.value = Colors.transparent;
              },
              child: Container(
                color: Colors.transparent,
                height: 68,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 25,
                  color: dash_controller.BackMiddle_seat.value,
                ),
              ),
            ))),
        Obx(() => Positioned(
            right: 93,
            top: 255,
            child: InkWell(
              onTap: () {
                dash_controller.Selected_val_seat.value = "BackRight";
                dash_controller.BackRight_seat.value =
                    Color.fromARGB(255, 2, 250, 130);
                dash_controller.BackMiddle_seat.value = Colors.transparent;
                dash_controller.BackLeft_seat.value = Colors.transparent;
                dash_controller.Driving_seat.value = Colors.transparent;
                dash_controller.Front_seat.value = Colors.transparent;
              },
              child: Container(
                color: Colors.transparent,
                height: 68,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 50,
                  color: dash_controller.BackRight_seat.value,
                ),
              ),
            ))),
      ],
    );
  }
}

class SheetButtonWidget extends StatefulWidget {
  const SheetButtonWidget({Key? key}) : super(key: key);

  @override
  State<SheetButtonWidget> createState() => _SheetButtonWidgetState();
}

class _SheetButtonWidgetState extends State<SheetButtonWidget> {
  bool chkshopadd = false;
  bool success = false;
  @override
  Widget build(BuildContext context) {
    return !chkshopadd
        ? MaterialButton(
            onPressed: () async {
              setState(() {
                chkshopadd = true;
              });

              await Future.delayed(Duration(seconds: 1));
              setState(() {
                success = true;
              });
              await Future.delayed(Duration(microseconds: 1000));
              Navigator.pop(context);
            },
            color: Colors.black,
            child: Text("Add Shop", style: TextStyle(color: Colors.white)),
          )
        : !success
            ? CircularProgressIndicator()
            : Icon(
                Icons.check,
                color: Colors.green,
              );
  }
}
