import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/AddContacts_Screen_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/Contact_Model.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Login_Screen.dart';
import 'package:fyp_accident_detection_and_alert_system/Widgets/LoginSignup_Widgets.dart';
import 'package:get/get.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Animation/Fade_Animation_Controller.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  final controller = Get.put(AddContacts_Controller());

  @override
  Widget build(BuildContext context) {
    controller.isSearching.value =
        controller.searchcontroller.value.text.isNotEmpty;
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
          "Add Contacts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFC6C37),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                MyFadeIn(
                    delaymseconds: 2500,
                    child: MyTextField(
                      mrgintop: 10,
                      child: TextFormField(
                        controller: controller.searchcontroller,
                        cursorColor: const Color(0xffF5591f),
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Color(0xffF5591f),
                          ),
                          hintText: "Search Contact",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    )),
                Container(
                  height: height * (0.75),
                  margin: const EdgeInsets.only(top: 10),
                  child: Obx(
                    () => GridView.builder(
                      cacheExtent: 30,
                      primary: true,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 0.0,
                              crossAxisSpacing: 0.0,
                              childAspectRatio: 10 / 2),
                      shrinkWrap: true,
                      itemBuilder: (context, int i) {
                        Contact contact = controller.isSearching.value == true
                            ? controller.contactsFiltered[i]
                            : controller.contacts[i];
                        return MyFadeIn(
                            delaymseconds: 2500,
                            child: ListTile(
                                title: Text(contact.displayName.toString()),
                                subtitle: Text(
                                    (contact.phones?.elementAt(0).value)
                                        .toString()),
                                trailing: Container(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      elevation: 0,
                                    ),
                                    onPressed: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();

                                      if (prefs.getString("Phone_Number") !=
                                          null) {
                                        controller.AddContact(EmergencyContacts(
                                            cid: 0,
                                            uid: prefs.getInt("uid")!,
                                            cname:
                                                contact.displayName.toString(),
                                            cphno: contact.phones!
                                                .elementAt(0)
                                                .value
                                                .toString()));
                                      } else {
                                        Get.snackbar(
                                          "Login Error",
                                          "It seems that your account number is missing login Again",
                                          snackPosition: SnackPosition.BOTTOM,
                                          padding: const EdgeInsets.all(20),
                                          margin: const EdgeInsets.only(
                                              bottom: 10, left: 15, right: 15),
                                          backgroundColor: Color(0xFFFFDCD1),
                                        );
                                        await const Duration(seconds: 3)
                                            .delay();

                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const Login())));
                                      }
                                    },
                                    child: const Text(
                                      "ADD",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                                leading: (contact.avatar != null &&
                                        contact.avatar!.isNotEmpty)
                                    ? CircleAvatar(
                                        backgroundImage: MemoryImage(contact
                                            .avatar!.buffer
                                            .asUint8List()),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        child: Text(
                                          contact.initials(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      )));
                      },
                      itemCount: controller.isSearching.value == true
                          ? controller.contactsFiltered.value.length
                          : controller.contacts.value.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
