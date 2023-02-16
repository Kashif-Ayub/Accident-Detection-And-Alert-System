import 'dart:convert';

import 'package:fyp_accident_detection_and_alert_system/Controllers/Constant.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/ModifyModel.dart';

class ModifyController extends GetxController {
  var bucklist = List<ModifyModel>.empty().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _GetBuckles();
  }

  _GetBuckles() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      bool flag = false;
      Ucars.forEach((element) {
        if (element.vtype == Selected_val_car.value) {
          flag = true;
        }
      });
      if (flag) {
        userCar = Selected_val_car.value;
      } else {
        userCar = Ucars[0].vtype;
      }
      String phno = _prefs.getString("Phone_Number")!;
      var response = await http.get(
        Uri.parse(MyUrl.Url + "/GetCarBuckles?car=$userCar&&uphno=$phno"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
      if (response.statusCode == 200) {
        Iterable itr = jsonDecode(response.body);
        bucklist.value = itr.map((e) => ModifyModel.fromJson(e)).toList();
        wireframe.value = bucklist[0];
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
