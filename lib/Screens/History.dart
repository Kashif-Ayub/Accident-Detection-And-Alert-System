import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/History_Screen_Controller.dart';

class HistorySreen extends StatefulWidget {
  const HistorySreen({Key? key}) : super(key: key);

  @override
  State<HistorySreen> createState() => _HistorySreenState();
}

class _HistorySreenState extends State<HistorySreen> {
  final _controller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
              splashColor: const Color.fromARGB(255, 175, 131, 0),
            )
          ],
          leading: CircleAvatar(
            child: Image.asset("assets/images/Logo.png"),
            backgroundColor: const Color.fromARGB(255, 255, 200, 2),
          ),
          title: const Text(
            "History",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFFC6C37),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Obx(() => ListWheelScrollView.useDelegate(
                perspective: 0.01,
                physics: const FixedExtentScrollPhysics(),
                itemExtent: 270.0,
                childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) => Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            color: Color.fromARGB(255, 248, 209, 197),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 25,
                            child: Column(
                              children: [
                                Obx(() => Text(
                                      "${_controller.history[index].uname}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontStyle: FontStyle.italic),
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text("Contact No :",
                                              style: TextStyle(
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("Victim Car :",
                                              style: TextStyle(
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("Severity :",
                                              style: TextStyle(
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("Speed :",
                                              style: TextStyle(
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("Date :",
                                              style: TextStyle(
                                                color: Colors.black,
                                              )),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text("Time :",
                                              style: TextStyle(
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Obx(
                                            () => Text(
                                                "${_controller.history[index].uphno}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Obx(
                                            () => Text(
                                                "${_controller.history[index].car}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Obx(
                                            () => Text(
                                                "${_controller.history[index].forceoncabin >= 0 && _controller.history[index].forceoncabin <= 1000 ? "Safe" : _controller.history[index].forceoncabin > 1000 && _controller.history[index].forceoncabin < 2000 ? "Normal" : _controller.history[index].forceoncabin > 2000 && _controller.history[index].forceoncabin < 3000 ? "High" : _controller.history[index].forceoncabin > 3000 ? "Critical" : "Critical"}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Obx(
                                            () => Text(
                                                "${_controller.history[index].speed.round()} Km/h",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Obx(
                                            () => Text(
                                                "${_controller.history[index].accidentdate}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Obx(
                                            () => Text(
                                                "${_controller.history[index].accidenttime}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      )
                                    ]),
                              ],
                            ),
                          ),
                        ),
                    childCount: _controller.history.value.length)))));
  }
}
