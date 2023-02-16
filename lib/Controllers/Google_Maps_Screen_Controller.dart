import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Accident_Location_Track.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/ResponderLoationSaveModel.dart';
import '../Models/Responder_Location_Track.dart';
import 'Constant.dart';
import 'Url.dart';

class Google_Map_ControllerGetx extends GetxController {
  late StreamSubscription<Position> stream;
  var markers = List<Marker>.empty().obs;
  var responderstrack = List<ResponderLocationTrack>.empty().obs;
  var accidenttrack = List<AccidentLocationTrack>.empty().obs;
  late CameraPosition initialcameraposition;
  bool fetcher = true;
  var isgoing = false.obs;
  List<Marker> _list = [];
  var polylines = List<Polyline>.empty().obs;
  List<Polyline> _polylinelst = [];
  late double responderLat, responderLong;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialcameraposition =
        CameraPosition(target: LatLng(Acc_lat, Acc_long), zoom: 13.55);

    _LocationTrackFetcher();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    fetcher = false;
    try {
      stream.pause();
      stream.cancel();
    } catch (e) {
      print(e.toString());
    }
    super.onClose();
  }

  int itrchecker = 0;
  _LocationTrackFetcher() async {
    print(" _LocationTrackFetcher() called");

    print("calling........$phoneofvictim");
    final Uint8List respondercar_marker =
        await getBytesFromAssets("assets/images/respcar1.png", 150);
    final Uint8List accidentlocation_marker =
        await getBytesFromAssets("assets/images/Accident.png", 150);
    final Uint8List ambulance_marker =
        await getBytesFromAssets("assets/images/ambulance.png", 150);
    print("im here");
    _list.add(
      Marker(
          markerId: MarkerId("Accident"),
          icon: BitmapDescriptor.fromBytes(accidentlocation_marker),
          position: LatLng(Acc_lat, Acc_long),
          infoWindow: InfoWindow(title: " Victim =>$Victim_Name")),
    );
    markers.addAll(_list);
    while (fetcher == true) {
      // _list.clear();
      // _polylinelst.clear();

      var _accident_coordinates = await http.get(Uri.parse(MyUrl.Url +
          "/GetCoordinatesofAccident?victim_phone=$phoneofvictim&&nid=$notiid"));
      if (_accident_coordinates.statusCode == 200) {
        print("Returned Body=${_accident_coordinates.body}");
        Iterable itr = jsonDecode(_accident_coordinates.body);
        accidenttrack.value =
            itr.map((e) => AccidentLocationTrack.fromMap(e)).toList();
        List<LatLng> accidenttrackpoint = [];
        accidenttrackpoint.add(LatLng(Acc_lat, Acc_long));
        // for (var x in accidenttrack) {
        //   LatLng lng = LatLng(x.latitude, x.longitude);

        //   accidenttrackpoint.add(lng);
        // }

        print("ACCident Track:${accidenttrack[0].longitude}");

        for (int i = 0; i < accidenttrack.length; i++) {
          await Future.delayed(Duration(seconds: 1));

          _list.add(Marker(
              markerId: MarkerId("$i"),
              position:
                  LatLng(accidenttrack[i].latitude, accidenttrack[i].longitude),
              infoWindow: InfoWindow(title: "Victim  $Victim_Name "),
              icon: BitmapDescriptor.fromBytes(ambulance_marker)));
          markers.addAll(_list);

          LatLng lng =
              LatLng(accidenttrack[i].latitude, accidenttrack[i].longitude);

          accidenttrackpoint.add(lng);

          _polylinelst.add(Polyline(
              width: 6,
              color: Colors.red,
              points: accidenttrackpoint,

              // [
              //LatLng(Acc_lat, Acc_long),

              //LatLng(accidenttrack[0].latitude, accidenttrack[0].longitude)
              //],
              polylineId: PolylineId(
                accidenttrack[0].uid.toString(),
              )));
          polylines.add(_polylinelst[i]);
        }
      } else {}
      var _responders_coordinates = await http.get(Uri.parse(MyUrl.Url +
          "/GetCoordinatesofResonder?victim_phone=$phoneofvictim&&nid=$notiid"));
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
              icon: BitmapDescriptor.fromBytes(respondercar_marker),
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
          itrchecker++;
          markers.addAll(_list);
          polylines.addAll(_polylinelst);
        }

        //  }
        // for (int i = 0; i < _polylinelst.length; i++) {
        //   if (polylines.contains(_list[i])) {
        //   } else {
        //     polylines.add(_polylinelst[i]);
        //   }
        // }
        // for (int i = 1; i < polylines.length; i++) {
        //   bool presnet = false;
        //   for (int j = 0; j < _polylinelst.length; j++) {
        //     if (polylines[i].polylineId == _polylinelst[j].polylineId) {
        //       presnet = true;
        //       break;
        //     }
        //   }
        //   if (presnet == false) {
        //     polylines.removeAt(i);
        //   }
        // }

        // for (int i = 0; i < _list.length; i++) {
        //   if (markers.contains(_list[i])) {
        //   } else {
        //     markers.add(_list[i]);
        //   }
        // }
        // for (int i = 1; i < markers.length; i++) {
        //   bool presnet = false;
        //   for (int j = 0; j < _list.length; j++) {
        //     if (markers[i].markerId == _list[j].markerId) {
        //       presnet = true;
        //       break;
        //     }
        //   }
        //   if (presnet == false) {
        //     markers.removeAt(i);
        //   }
        // }
      }
    }
  }

  Update_ResponderLocation() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _phone = _prefs.getString("Phone_Number").toString();
    String _name = _prefs.getString("UserName").toString();

    // _AskForPermissions(() {
    // stream = Geolocator.getPositionStream(locationSettings: locationSettings)
    //     .listen((event) {});
    // stream.onData((data) async {
    try {
      ResponderLocationTrackSaveLocation trc =
          ResponderLocationTrackSaveLocation(
              cid: victimuid,
              latitude: responderLat,
              longitude: responderLong,
              rltid: 0,
              nid: notiid);
      print("MAP:${trc.toMap()}");
      var response = await http.post(
          Uri.parse(MyUrl.Url + "/UpdateLiveCoordinatesResponder"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: jsonEncode(trc.toMap()));
      if (response.statusCode == 200) {
        Get.snackbar(
            "Responder Location Updated ", "Live Location Updated Successfully",
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
    // });
    // });
  }

  _AskForPermissions(Function f) async {
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

  Future<Uint8List> getBytesFromAssets(String path, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
