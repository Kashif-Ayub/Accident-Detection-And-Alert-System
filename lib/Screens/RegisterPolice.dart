import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Animation/Fade_Animation_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Login_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Register_Screen.dart';
import 'package:fyp_accident_detection_and_alert_system/Widgets/LoginSignup_Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/RegisterPoliceController.dart';
import 'Login_Screen.dart';

class RegisterAsPolice extends StatefulWidget {
  const RegisterAsPolice({Key? key}) : super(key: key);

  @override
  State<RegisterAsPolice> createState() => _LoginState();
}

class _LoginState extends State<RegisterAsPolice> {
  final regcontroller = Get.put(RegisterPolice_Controller());
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
            key: regcontroller.fromkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyContainer(
                    height: height * (0.3),
                    width: width,
                    imageurl: "assets/images/Logo.png",
                    txt: "Register Police"),
                MyFadeIn(
                    delaymseconds: 2000,
                    child: MyTextField(
                      mrgintop: 60,
                      child: TextFormField(
                        controller: regcontroller.number,
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
                    delaymseconds: 2500,
                    child: MyTextField(
                      mrgintop: 30,
                      child: Obx(() => TextFormField(
                            controller: regcontroller.password,
                            obscureText: regcontroller.isPasswordHidden.value,
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
                              hintText: "Enter Your Password",
                              suffix: InkWell(
                                onTap: () {
                                  regcontroller.isPasswordHidden.value =
                                      !regcontroller.isPasswordHidden.value;
                                },
                                child: Icon(
                                  regcontroller.isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xffF5591f),
                                ),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          )),
                    )),
                MyFadeIn(
                    delaymseconds: 3000,
                    child: InkWell(
                        onTap: () {
                          if (regcontroller.is_loading_register_button.value ==
                              false) regcontroller.Register();
                        },
                        child: Obx(() => MyButton(
                              e: const EdgeInsets.only(
                                  left: 20, right: 20, top: 40),
                              child: regcontroller
                                      .is_loading_register_button.value
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
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            )))),
                MyFadeIn(
                    delaymseconds: 3500,
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
