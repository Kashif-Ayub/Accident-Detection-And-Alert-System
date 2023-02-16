import 'dart:convert';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Contacts_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Contact_Model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class AddContacts_Controller extends GetxController {
  var contacts = List<Contact>.empty().obs;
  var contactsFiltered = List<Contact>.empty().obs;
  late TextEditingController searchcontroller;
  var isSearching = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    AskforPermissions();
    searchcontroller = TextEditingController();
    isSearching.value = searchcontroller.value.text.isNotEmpty;
    searchcontroller.addListener(() {
      filterContacts();
    });
  }

  getAllContacts() async {
    contacts.value = (await ContactsService.getContacts()).toList();
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts.value);
    if (searchcontroller.value.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchterm = searchcontroller.value.text.toLowerCase();
        String contactname = contact.displayName!.toLowerCase();

        return contactname.contains(searchterm);
      });
      contactsFiltered.value = _contacts;
    }
  }

  void AskforPermissions() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      getAllContacts();
    } else if (status.isDenied) {
      Get.snackbar(
          "Contacts Access Required", "Allow the Permission to Pick Contacts",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
    }
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
    } else if (await Permission.contacts.isPermanentlyDenied) {
      Get.snackbar("Permenantly denied ", "Can't Load Contacts",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: Color(0xFFFFDCD1));
      Get.back();
    }
  }

  void AddContact(EmergencyContacts c) async {
    try {
      var response = await http.post(Uri.parse(MyUrl.Url + "/AddContact"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: jsonEncode(c.toMap()));
      if (response.statusCode == 200) {
        Get.snackbar("Emergency Contact Added Successfully ",
            "Name:${c.cname}  Phone Number:${c.cphno}",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
        final c_controller = Get.put(Contacts_Controller());
        c_controller.getEemergencyContacts();
      } else if (response.statusCode == 300) {
        Get.snackbar(" This Emergency Contact is  Already Added",
            "Name:${c.cname}  Phone Number:${c.cphno}",
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            backgroundColor: const Color(0xFFFFDCD1));
      }
    } catch (e) {
      Get.snackbar("Connectivity Issue", "Server is down it will be fixed Soon",
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
          backgroundColor: const Color(0xFFFFDCD1));
    }
  }
}
