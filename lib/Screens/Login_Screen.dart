import 'package:fyp_accident_detection_and_alert_system/Animation/Fade_Animation_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Login_Controller.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/RegisterPolice.dart';
import 'package:fyp_accident_detection_and_alert_system/Screens/Register_Screen.dart';
import 'package:fyp_accident_detection_and_alert_system/Widgets/LoginSignup_Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final logincontroller = Get.put(Login_Controller());
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
            key: logincontroller.loginformkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyContainer(
                    height: height * (0.3),
                    width: width,
                    imageurl: "assets/images/Logo.png",
                    txt: "Login"),
                MyFadeIn(
                    delaymseconds: 2000,
                    child: MyTextField(
                      mrgintop: 60,
                      child: TextFormField(
                        controller: logincontroller.phnocontroller,
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
                            controller: logincontroller.passwordcontroller,
                            obscureText: logincontroller.isPasswordHidden.value,
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
                                  logincontroller.isPasswordHidden.value =
                                      !logincontroller.isPasswordHidden.value;
                                },
                                child: Icon(
                                  logincontroller.isPasswordHidden.value
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
                          if (logincontroller.isloading_login_button.value ==
                              false) logincontroller.Login();
                        },
                        child: Obx(() => MyButton(
                              e: const EdgeInsets.only(
                                  left: 20, right: 20, top: 40),
                              child: logincontroller
                                      .isloading_login_button.value
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
                      margin: EdgeInsets.only(top: 20, left: width * (0.2)),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const Register()));
                            },
                            child: const Text(
                              "Register As User",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterAsPolice()));
                            },
                            child: const Text(
                              "Register As Police",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
