import 'dart:convert';

import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Notification_Model.dart';

class PoliceHistoryController extends GetxController {
  var history = List<Accident_Notification>.empty().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    _GetHistory();
    super.onInit();
  }

  _GetHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var response = await http.get(
        Uri.parse(MyUrl.Url + "/GetAllAlert1"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        Iterable itr = jsonDecode(response.body);
        history.value =
            itr.map((e) => Accident_Notification.fromMap(e)).toList();
      } else {
        print(jsonDecode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
