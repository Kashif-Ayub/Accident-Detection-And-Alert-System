import 'package:fyp_accident_detection_and_alert_system/Controllers/Register_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Widgets/LoginSignup_Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Animation/Fade_Animation_Controller.dart';
import 'Login_Screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final controller = Get.put(Register_Controller());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.maybeOf(context)!.size.height;
    double width = MediaQuery.maybeOf(context)!.size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SingleChildScrollView(
              child: Form(
            key: controller.fromkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyContainer(
                    height: height * (0.3),
                    width: width,
                    imageurl: "assets/images/Logo.png",
                    txt: "Register User"),
                MyFadeIn(
                    delaymseconds: 2000,
                    child: MyTextField(
                      mrgintop: 15,
                      child: TextFormField(
                        controller: controller.name,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Required Fill out the Fields";
                          }
                          return null;
                        },
                        cursorColor: const Color(0xffF5591f),
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xffF5591f),
                          ),
                          hintText: "Enter Your name",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    )),
                MyFadeIn(
                    delaymseconds: 2500,
                    child: MyTextField(
                      mrgintop: 20,
                      child: TextFormField(
                        controller: controller.number,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Required Fill out the Fields";
                          }
                          return null;
                        },
                        cursorColor: const Color(0xffF5591f),
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.phone,
                            color: Color(0xffF5591f),
                          ),
                          hintText: "Enter Your phone Number",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )),
                MyFadeIn(
                    delaymseconds: 3000,
                    child: MyTextField(
                      mrgintop: 20,
                      child: TextFormField(
                        controller: controller.vehiclenumber,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Required Fill out the Fields";
                          }
                          return null;
                        },
                        cursorColor: const Color(0xffF5591f),
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.car_rental,
                            color: Color(0xffF5591f),
                          ),
                          hintText: "Enter Your Car Number",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    )),
                MyFadeIn(
                    delaymseconds: 3500,
                    child: MyTextField(
                      mrgintop: 20,
                      child: Obx(() => TextFormField(
                            controller: controller.password,
                            obscureText: controller.isPasswordHidden.value,
                            obscuringCharacter: "*",
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Required Fill out the Fields";
                              }
                              return null;
                            },
                            cursorColor: const Color(0xffF5591f),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.key,
                                color: Color(0xffF5591f),
                              ),
                              suffix: InkWell(
                                onTap: () {
                                  controller.isPasswordHidden.value =
                                      !controller.isPasswordHidden.value;
                                },
                                child: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xffF5591f),
                                ),
                              ),
                              hintText: "Enter Your Password",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          )),
                    )),
                MyFadeIn(
                    delaymseconds: 4000,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200],
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ]),
                      alignment: Alignment.center,
                      child: Obx(() => controller.lst.value.isNotEmpty
                          ? DropdownButtonFormField(
                              value: controller.selected_val.value,
                              items: controller.lst.value
                                  .map((e) => DropdownMenuItem(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (v) {
                                controller.selected_val.value = v as String;
                              },
                              dropdownColor:
                                  const Color.fromARGB(255, 255, 150, 138),
                              icon: const Icon(
                                Icons.arrow_drop_down_circle,
                                color: Colors.deepOrange,
                              ),
                              decoration: const InputDecoration(
                                labelText: "Select Car",
                                labelStyle: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold),
                                icon: Icon(
                                  Icons.drive_eta,
                                  color: Color(0xffF5591f),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(
                                  color: Colors.deepOrange,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Loading Cars...",
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            )),
                    )),
                MyFadeIn(
                    delaymseconds: 4500,
                    child: InkWell(
                        onTap: () {
                          if (controller.is_loading_register_button.value ==
                              false) {
                            controller.Register();
                          }
                        },
                        child: Obx(() => MyButton(
                              e: const EdgeInsets.only(
                                  left: 20, right: 20, top: 25),
                              child: controller.is_loading_register_button.value
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Please Wait...",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    )
                                  : const Text(
                                      "Register",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            )))),
                MyFadeIn(
                    delaymseconds: 5000,
                    child: Container(
                      margin: EdgeInsets.only(top: 15, left: width * (0.2)),
                      child: Row(
                        children: [
                          const Text(
                            "Already Have Account?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            child: const Text(
                              "Login Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
