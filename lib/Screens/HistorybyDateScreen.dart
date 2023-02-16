import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Animation/Fade_Animation_Controller.dart';
import '../Controllers/HistoryByDateController.dart';
import '../Controllers/History_Screen_Controller.dart';
import 'PoliceDashBoard.dart';

class HistoryByDateSreen extends StatefulWidget {
  const HistoryByDateSreen({Key? key}) : super(key: key);

  @override
  State<HistoryByDateSreen> createState() => _HistoryByDateSreenState();
}

class _HistoryByDateSreenState extends State<HistoryByDateSreen> {
  final _controller = Get.put(HistoryByDateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (con) => PoliceDashBoard()));
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
            "History By Date",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFFC6C37),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 100,
                      child: MyFadeIn(
                          delaymseconds: 1000,
                          child: Container(
                            height: 50,
                            // margin: EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: Color(0xffEEEEEE)),
                                ]),
                            alignment: Alignment.center,
                            child: Obx(() => DropdownButtonFormField(
                                  value: _controller.Selected_val_day.value,
                                  items: _controller.days.value
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: e.toString(),
                                          ))
                                      .toList(),
                                  onChanged: (v) {
                                    _controller.Selected_val_day.value =
                                        v as String;
                                    _controller.GetHistoryByDate();
                                  },
                                  dropdownColor:
                                      const Color.fromARGB(255, 255, 150, 138),
                                  icon: const Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Colors.deepOrange,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Date",
                                    labelStyle: TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                )),
                          )),
                    ),
                    SizedBox(
                      height: 60,
                      width: 100,
                      child: MyFadeIn(
                          delaymseconds: 1000,
                          child: Container(
                            height: 50,
                            // margin: EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: Color(0xffEEEEEE)),
                                ]),
                            alignment: Alignment.center,
                            child: Obx(() => DropdownButtonFormField(
                                  value: _controller.Selected_val_month.value,
                                  items: _controller.month.value
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: e.toString(),
                                          ))
                                      .toList(),
                                  onChanged: (v) {
                                    _controller.Selected_val_month.value =
                                        v as String;
                                    _controller.GetHistoryByDate();
                                  },
                                  dropdownColor:
                                      const Color.fromARGB(255, 255, 150, 138),
                                  icon: const Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Colors.deepOrange,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Month",
                                    labelStyle: TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                )),
                          )),
                    ),
                    SizedBox(
                      height: 60,
                      width: 100,
                      child: MyFadeIn(
                          delaymseconds: 1000,
                          child: Container(
                            height: 50,
                            // margin: EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[200],
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: Color(0xffEEEEEE)),
                                ]),
                            alignment: Alignment.center,
                            child: Obx(() => DropdownButtonFormField(
                                  value: _controller.Selected_val_year.value,
                                  items: _controller.year.value
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: e.toString(),
                                          ))
                                      .toList(),
                                  onChanged: (v) {
                                    _controller.Selected_val_year.value =
                                        v as String;
                                    _controller.GetHistoryByDate();
                                  },
                                  dropdownColor:
                                      const Color.fromARGB(255, 255, 150, 138),
                                  icon: const Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Colors.deepOrange,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Year",
                                    labelStyle: TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                )),
                          )),
                    ),
                  ],
                ),
              ),

              //  ListWheelScrollView.useDelegate(
              //     perspective: 0.01,
              //     physics: const FixedExtentScrollPhysics(),
              //     itemExtent: 270.0,
              //     childDelegate: ListWheelChildBuilderDelegate(
              //         builder: (context, index) =>
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Obx(() => ListWheelScrollView.useDelegate(
                      perspective: 0.01,
                      physics: const FixedExtentScrollPhysics(),
                      itemExtent: 270.0,
                      childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
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
                          childCount: _controller.history.value.length)))
                  // ListView.builder(
                  //   itemBuilder: (context, index) {
                  //     return Container(
                  //       height: MediaQuery.of(context).size.height * 0.4,
                  //       width: MediaQuery.of(context).size.width * 0.8,
                  //       child: Card(
                  //         color: Color.fromARGB(255, 248, 209, 197),
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8)),
                  //         elevation: 25,
                  //         child: Column(
                  //           children: [
                  //             Obx(() => Text(
                  //                   "${_controller.history[index].uname}",
                  //                   style: TextStyle(
                  //                       fontSize: 30,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.red,
                  //                       fontStyle: FontStyle.italic),
                  //                 )),
                  //             SizedBox(
                  //               height: 30,
                  //             ),
                  //             Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 children: [
                  //                   Column(
                  //                     children: [
                  //                       Text("Contact No :",
                  //                           style: TextStyle(
                  //                             color: Colors.black,
                  //                           )),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Text("Victim Car :",
                  //                           style: TextStyle(
                  //                             color: Colors.black,
                  //                           )),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Text("Severity :",
                  //                           style: TextStyle(
                  //                             color: Colors.black,
                  //                           )),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Text("Speed :",
                  //                           style: TextStyle(
                  //                             color: Colors.black,
                  //                           )),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Text("Date :",
                  //                           style: TextStyle(
                  //                             color: Colors.black,
                  //                           )),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Text("Time :",
                  //                           style: TextStyle(
                  //                             color: Colors.black,
                  //                           )),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Obx(
                  //                         () => Text(
                  //                             "${_controller.history[index].uphno}",
                  //                             style: TextStyle(
                  //                                 color: Colors.black,
                  //                                 fontWeight:
                  //                                     FontWeight.bold)),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Obx(
                  //                         () => Text(
                  //                             "${_controller.history[index].car}",
                  //                             style: TextStyle(
                  //                                 color: Colors.black,
                  //                                 fontWeight:
                  //                                     FontWeight.bold)),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Obx(
                  //                         () => Text(
                  //                             "${_controller.history[index].forceoncabin >= 0 && _controller.history[index].forceoncabin <= 1000 ? "Safe" : _controller.history[index].forceoncabin > 1000 && _controller.history[index].forceoncabin < 2000 ? "Normal" : _controller.history[index].forceoncabin > 2000 && _controller.history[index].forceoncabin < 3000 ? "High" : _controller.history[index].forceoncabin > 3000 ? "Critical" : "Critical"}",
                  //                             style: TextStyle(
                  //                                 color: Colors.black,
                  //                                 fontWeight:
                  //                                     FontWeight.bold)),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Obx(
                  //                         () => Text(
                  //                             "${_controller.history[index].speed.round()} Km/h",
                  //                             style: TextStyle(
                  //                                 color: Colors.black,
                  //                                 fontWeight:
                  //                                     FontWeight.bold)),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Obx(
                  //                         () => Text(
                  //                             "${_controller.history[index].accidentdate}",
                  //                             style: TextStyle(
                  //                                 color: Colors.black,
                  //                                 fontWeight:
                  //                                     FontWeight.bold)),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 8,
                  //                       ),
                  //                       Obx(
                  //                         () => Text(
                  //                             "${_controller.history[index].accidenttime}",
                  //                             style: TextStyle(
                  //                                 color: Colors.black,
                  //                                 fontWeight:
                  //                                     FontWeight.bold)),
                  //                       )
                  //                     ],
                  //                   )
                  //                 ]),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   itemCount: _controller.history.length,
                  // ),
                  )
              //  Container(
              //         height: MediaQuery.of(context).size.height * 0.4,
              //         width: MediaQuery.of(context).size.width * 0.8,
              //         child: Card(
              //           color: Color.fromARGB(255, 248, 209, 197),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(8)),
              //           elevation: 25,
              //           child: Column(
              //             children: [
              //               Obx(() => Text(
              //                     "${_controller.history[index].uname}",
              //                     style: TextStyle(
              //                         fontSize: 30,
              //                         fontWeight: FontWeight.bold,
              //                         color: Colors.red,
              //                         fontStyle: FontStyle.italic),
              //                   )),
              //               SizedBox(
              //                 height: 30,
              //               ),
              //               Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceAround,
              //                   children: [
              //                     Column(
              //                       children: [
              //                         Text("Contact No :",
              //                             style: TextStyle(
              //                               color: Colors.black,
              //                             )),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Text("Victim Car :",
              //                             style: TextStyle(
              //                               color: Colors.black,
              //                             )),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Text("Severity :",
              //                             style: TextStyle(
              //                               color: Colors.black,
              //                             )),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Text("Speed :",
              //                             style: TextStyle(
              //                               color: Colors.black,
              //                             )),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Text("Date :",
              //                             style: TextStyle(
              //                               color: Colors.black,
              //                             )),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Text("Time :",
              //                             style: TextStyle(
              //                               color: Colors.black,
              //                             )),
              //                       ],
              //                     ),
              //                     Column(
              //                       children: [
              //                         Obx(
              //                           () => Text(
              //                               "${_controller.history[index].uphno}",
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontWeight:
              //                                       FontWeight.bold)),
              //                         ),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Obx(
              //                           () => Text(
              //                               "${_controller.history[index].car}",
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontWeight:
              //                                       FontWeight.bold)),
              //                         ),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Obx(
              //                           () => Text(
              //                               "${_controller.history[index].forceoncabin >= 0 && _controller.history[index].forceoncabin <= 1000 ? "Safe" : _controller.history[index].forceoncabin > 1000 && _controller.history[index].forceoncabin < 2000 ? "Normal" : _controller.history[index].forceoncabin > 2000 && _controller.history[index].forceoncabin < 3000 ? "High" : _controller.history[index].forceoncabin > 3000 ? "Critical" : "Critical"}",
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontWeight:
              //                                       FontWeight.bold)),
              //                         ),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Obx(
              //                           () => Text(
              //                               "${_controller.history[index].speed.round()} Km/h",
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontWeight:
              //                                       FontWeight.bold)),
              //                         ),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Obx(
              //                           () => Text(
              //                               "${_controller.history[index].accidentdate}",
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontWeight:
              //                                       FontWeight.bold)),
              //                         ),
              //                         SizedBox(
              //                           height: 8,
              //                         ),
              //                         Obx(
              //                           () => Text(
              //                               "${_controller.history[index].accidenttime}",
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontWeight:
              //                                       FontWeight.bold)),
              //                         )
              //                       ],
              //                     )
              //                   ]),
              //             ],
              //           ),
              //         ),
              //       ),
              // childCount: _controller.history.value.length)
            ],
          ),
        )));
  }
}
