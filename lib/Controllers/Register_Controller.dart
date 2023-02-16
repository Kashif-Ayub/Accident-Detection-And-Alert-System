import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Register_Model_CarType.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Register_Model_UserData.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Login_Screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Register_Controller extends GetxController {
  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  late TextEditingController name = TextEditingController();
  late TextEditingController number = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController vehiclenumber = TextEditingController();
  // var lst = List<CarType>.empty().obs;
  var lst = List<String>.empty().obs;
  var selected_val = "".obs;
  var is_loading_register_button = false.obs;
  var isPasswordHidden = true.obs;

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
    // await _getCarsCategories();
    // lst.add(CarType(vehicle_type: "Other"));
    lst.add("Honda Civic 2019");
    lst.add("Toyota Corolla 2014");
    lst.add("Vitz");
    lst.add("Suzuki Alto");
    lst.add("Other");

    selected_val = lst[0].obs;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    name.clear();
    password.clear();
    number.clear();
    vehiclenumber.clear();

    name.dispose();
    password.dispose();
    number.dispose();
    vehiclenumber.dispose();
    super.onClose();
  }

  // _getCarsCategories() async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse(MyUrl.Url + "/Get_Available_Car_Types"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json;charset=UTF-8'
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       Iterable list = jsonDecode(response.body);
  //       lst.value = list.map((e) => CarType.fromMap(e)).toList();
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //         "Connectivity Issue ", "Server is Down It Will Be Fixed Soon",
  //         snackPosition: SnackPosition.BOTTOM,
  //         padding: const EdgeInsets.all(20),
  //         margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
  //         backgroundColor: const Color(0xFFFFDCD1));
  //   }
  // }

  _CallApi_Register() async {
    try {
      Register_User usr = Register_User(
          uname: name.value.text,
          phno: number.value.text,
          password: password.value.text,
          vnumber: vehiclenumber.value.text,
          vtype: selected_val.value);

      var response = await http.post(Uri.parse(MyUrl.Url + "/Register"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: jsonEncode(usr.toMap()));

      if (response.statusCode == 200) {
        Get.snackbar("Successfully Registered ", "Login Now",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
        await const Duration(seconds: 5).delay();
        is_loading_register_button.value = false;
        Navigator.of(fromkey.currentState!.context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const Login())));
      }
    } catch (e) {
      Get.snackbar(
          "Connectivity Issue ", "Server is Down It Will Be Fixed Soon",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
      await const Duration(seconds: 5).delay();
      is_loading_register_button.value = false;
    }
  }
  // print(MyUrl.Url +
  //     "/Register?dt:" +
  //     jsonEncode(Register_User(
  //             uname: name.value.text,
  //             phno: number.value.text,
  //             password: password.value.text)
  //         .toMap()) +
  //     "&vs:" +
  //     jsonEncode(Register_Car(
  //             vid: vehiclenumber.value.text, vtype: selected_val.value)
  //         .toMap()) +
  //     "");
  // var response = await http.post(
  //   Uri.parse(MyUrl.Url +
  //       "/Register?dt=" +
  //       jsonEncode(Register_User(
  //               uname: name.value.text,
  //               phno: number.value.text,
  //               password: password.value.text)
  //           .toMap()) +
  //       "&vs=" +
  //       jsonEncode(Register_Car(
  //               vid: vehiclenumber.value.text, vtype: selected_val.value)
  //           .toMap()) +
  //       ""),

  // print(jsonEncode(
  //   {
  //     'dt': Register_User(
  //             uname: name.value.text,
  //             phno: number.value.text,
  //             password: password.value.text)
  //         .toMap(),
  //     'vs': Register_Car(
  //             vid: vehiclenumber.value.text, vtype: selected_val.value)
  //         .toMap()
  //   },
  // ));
  // print(Uri.parse(MyUrl.Url +
  //     "/Register?dt=" +
  //     <String,dynamic>{usr.toMap()}+
  //     "&vs=" +
  //     car.toMap().toString() +
  //     ""));

  // var request =
  //     http.MultipartRequest('POST', Uri.parse(MyUrl.Url + "/Register"));
  // request.fields["UserData"] = mp.toString();
  // request.fields["Vehicle"] = m1.toString();
  // request.headers.addAll({'Content-Type': 'multipart/form-data'});
  // var response = await request.send();
  // if (response.statusCode == 200) {
  //   print("Ok call");
  // } else {
  //   print(response.request);
  // }

  // Map data = {'dt': mp, 'vs': m1};
  // String body = jsonEncode(data);
  // var response = await http.post(Uri.parse(MyUrl.Url + "/Register"),
  //     headers: {'Content-Type': 'application/json'}, body: body);
  // print(response.body);
  // var request =
  //     http.MultipartRequest("POST", Uri.parse(MyUrl.Url + "/Register"));
  // request.fields['dt'] = mp.toString();
  // request.fields['vs'] = m1.toString();
  // var response = await http.Response.fromStream(await request.send());
  // print(response.body);

  // var request_body = {"dt": mp, "vs": m1};
  // var response = await http.post(Uri.parse(MyUrl.Url + "/Register"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/x-www-form-urlencoded'
  //     },
  //     body: request_body.toString());
  // print(response.body);
  // headers: <String, String>{
  //   'Content-Type': 'application/x-www-form-urlencoded'
  // },
  // headers: <String, String>{
  //   'Content-Type': 'application/json;charset=UTF-8'
  // },
  //     body: jsonEncode({"UserData": mp, "Vehicle": m1}));
  // print(response.body);
  //print(jsonEncode({"UserData": usr.toMap(), "Vehicle": car.toMap()}));
  // print(jsonEncode(
  //   {
  //     'dt': {
  //       Register_User(
  //               uname: name.value.text,
  //               phno: number.value.text,
  //               password: password.value.text)
  //           .toMap()
  //     },
  //     'vs': {
  //       Register_Car(vid: vehiclenumber.value.text, vtype: selected_val.value)
  //           .toMap()
  //     }
  //   },
  // ));

  // print(response.body);

  void Register() async {
    if (fromkey.currentState!.validate()) {
      is_loading_register_button.value = true;
      if (selected_val.value != "Other") {
        await _CallApi_Register();
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("name", name.value.text);
        prefs.setString("number", number.value.text);
        prefs.setString("password", password.value.text);
        prefs.setString("vehiclenumber", vehiclenumber.value.text);
        await const Duration(seconds: 5).delay();
        is_loading_register_button.value = false;
      }
    }
  }
}
