import 'dart:async';
import 'package:slider_button/slider_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Google_Maps_Screen_Controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Google_Map extends StatefulWidget {
  const Google_Map({
    Key? key,
  }) : super(key: key);

  @override
  State<Google_Map> createState() => _Google_MapState();
}

class _Google_MapState extends State<Google_Map> {
  final _getx_controller = Get.put(Google_Map_ControllerGetx());

  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.maybeOf(context)!.size.height;
    double width = MediaQuery.maybeOf(context)!.size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
        height: height - 10,
        width: width,
        child: Stack(
          children: [
            Obx(() => GoogleMap(
                  onTap: (argument) {
                    if (_getx_controller.isgoing.value) {
                      _getx_controller.responderLat = argument.latitude;
                      _getx_controller.responderLong = argument.longitude;
                      _getx_controller.Update_ResponderLocation();
                    }
                  },
                  polylines: Set<Polyline>.of(_getx_controller.polylines.value),
                  initialCameraPosition: _getx_controller.initialcameraposition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: Set<Marker>.of(_getx_controller.markers.value),
                )),
            if (_getx_controller.isgoing.value == false)
              Positioned(
                top: 40,
                left: 30,
                child: SliderButton(
                    baseColor: Color.fromARGB(255, 161, 31, 31),
                    backgroundColor: Color.fromARGB(255, 252, 197, 197),
                    highlightedColor: Color.fromARGB(255, 255, 120, 58),
                    buttonColor: Color.fromARGB(255, 255, 53, 3),
                    vibrationFlag: true,
                    height: 60,
                    width: 180,
                    action: () {
                      _getx_controller.isgoing.value = true;
                    },
                    label: const Text(
                      "I'm Going!!!",
                      style: TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    icon: const Icon(
                      Icons.follow_the_signs,
                      size: 44,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              )

            // InkWell(
            //     onTap: () {},
            //  child:
            // Container(
            //   height: 45,
            //   width: width * (0.5),
            //   decoration: BoxDecoration(
            //       color: Colors.deepOrange,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(50),
            //           bottomRight: Radius.circular(50))),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Icon(
            //         Icons.drive_eta,
            //         color: Colors.black,
            //         size: 30,
            //       ),
            //       SizedBox(
            //         width: 15,
            //       ),
            //       Text(
            //         "I'm Going",
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18),
            //       )
            //     ],
            //   ),
            // ),
            // )),
          ],
        ),
      )),
    );
  }
}
