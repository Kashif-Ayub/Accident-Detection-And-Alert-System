import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Notification_Model.dart';
import 'Url.dart';

class HistoryByDateController extends GetxController {
  var days = List<String>.empty().obs;
  var month = List<String>.empty().obs;
  var year = List<String>.empty().obs;
  var Selected_val_day = "".obs;
  var Selected_val_month = "".obs;
  var Selected_val_year = "".obs;
  var history = List<Accident_Notification>.empty().obs;
  @override
  void onInit() {
    // TODO: implement onInit

    _AssignVals();
    super.onInit();
  }

  _AssignVals() {
    for (int i = 0; i < 31; i++) {
      if (i + 1 < 10) {
        days.add("0${(i + 1).toString()}");
      } else {
        days.add((i + 1).toString());
      }
    }
    Selected_val_day.value = days[0];
    for (int i = 0; i < 12; i++) {
      if (i + 1 < 10) {
        month.add("0${(i + 1).toString()}");
      } else {
        month.add(i.toString());
      }
    }
    Selected_val_month.value = month[2];
    for (int i = 2000; i < 2027; i++) {
      year.add((i + 1).toString());
    }
    Selected_val_year.value = year[21];
  }

  GetHistoryByDate() async {
    try {
      history.value.clear();
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? uphno = prefs.getString("Phone_Number");
      // if (uphno != null) {
      String date = Selected_val_day.value +
          "/" +
          Selected_val_month.value +
          "/" +
          Selected_val_year.value.substring(2, 4);
      print(date);
      var response = await http.get(
        Uri.parse(MyUrl.Url + "/GetHistoryByDate?date=$date"),
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
      // }
    } catch (e) {
      print(e.toString());
    }
  }
}
