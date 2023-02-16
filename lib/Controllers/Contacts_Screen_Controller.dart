import 'dart:convert';

import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Contact_Model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant.dart';

class Contacts_Controller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEemergencyContacts();
  }

  getEemergencyContacts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var response = await http.get(
          Uri.parse(MyUrl.Url +
              "/GetContacts?uid_phno=" +
              prefs.getString("Phone_Number").toString() +
              ""),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          });
      if (response.statusCode == 200) {
        Iterable list = jsonDecode(response.body);
        print(jsonDecode(response.body));
        clist.value = list.map((e) => EmergencyContacts.fromMap(e)).toList();
        print(clist.value);
      } else if (response.statusCode == 204) {
        Get.snackbar(
          "Add Emergency Contacts",
          "No Emergency Contacts Are Added yet add them so that in case of emergency they will be updated ",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
