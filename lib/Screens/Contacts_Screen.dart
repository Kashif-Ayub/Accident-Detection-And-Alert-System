import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Animation/Fade_Animation_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Constant.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Contacts_Screen_Controller.dart';
import 'package:get/get.dart';

import '../Controllers/Constant.dart';
import '../Controllers/Constant.dart';
import 'AddContacts_Screen.dart';

class Contacts extends StatelessWidget {
  Contacts({Key? key}) : super(key: key);

  final c_controller = Get.put(Contacts_Controller());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.maybeOf(context)!.size.height;

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
          "Emergency Contacts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFC6C37),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Contacts",
        elevation: 18,
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Get.to(() => AddContacts());
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: height * (0.85),
                  child: Obx(() => GridView.builder(
                        cacheExtent: 30,
                        primary: true,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 0.0,
                                crossAxisSpacing: 0.0,
                                childAspectRatio: 10 / 2),
                        itemBuilder: (context, i) {
                          return MyFadeIn(
                              delaymseconds: 2500,
                              child: ListTile(
                                  title: Text(
                                    clist[i].cname,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Text(clist[i].cphno),
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    child: Text(
                                      clist[i]
                                          .cname
                                          .substring(0, 2)
                                          .toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  )));
                        },
                        itemCount: clist.value.length,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
