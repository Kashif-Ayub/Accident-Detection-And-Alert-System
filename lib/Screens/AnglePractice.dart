// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_accident_detection_and_alert_system/Controllers/Url.dart';
import 'package:fyp_accident_detection_and_alert_system/Models/SaveAnglemodel.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xls;
import 'package:http/http.dart' as http;

class FinalAngel extends StatefulWidget {
  const FinalAngel({Key? key}) : super(key: key);

  @override
  State<FinalAngel> createState() => _FinalAngelState();
}

class _FinalAngelState extends State<FinalAngel> {
  late TextEditingController txtang;
  // double x = 0, y = 0, z = 0;
  // String direction = "none";

  // @override
  // void initState() {
  //   gyroscopeEvents.listen((GyroscopeEvent event) {
  //     print(event);

  //     x = event.x;
  //     y = event.y;
  //     z = event.z;

  //     //rough calculation, you can use
  //     //advance formula to calculate the orentation
  //     if (x > 0) {
  //       direction = "back";
  //     } else if (x < 0) {
  //       direction = "forward";
  //     }

  //     if (y > 0) {
  //       direction = "left";
  //     } else if (y < 0) {
  //       direction = "right";
  //     }

  //     setState(() {});
  //   });
  //   super.initState();
  // }
  /////////////////////////

  late StreamSubscription<AccelerometerEvent> strm;
  late StreamSubscription<AccelerometerEvent> st;
  void initState() {
    // TODO: implement initState
    super.initState();
    //  _createExcel();
    //writeAngle("AAA");
    txtang = new TextEditingController();
    _makeStream();

    //_Timer();
  }

//   Future<void> _createExcel() async {
//     // Create a new Excel document.
//     final xls.Workbook workbook = new xls.Workbook();
// //Accessing worksheet via index.
//     final xls.Worksheet sheet = workbook.worksheets[0];

// //Applying Number format.
//     sheet.getRangeByName('A1').builtInStyle = xls.BuiltInStyles.linkedCell;

// // Save the document.
//     final List<int> bytes = workbook.saveAsStream();
//     File('ApplyBuildInStyle.xlsx').writeAsBytes(bytes, mode: FileMode.append);
// //Dispose the workbook.
//     workbook.dispose();
// //Create an Excel document.

//     //Creating a workbook.
//     // final xls.Workbook workbook = xls.Workbook();
//     // //Accessing via index
//     // final xls.Worksheet sheet = workbook.worksheets[0];
//     // sheet.showGridlines = false;

//     // // Enable calculation for worksheet.
//     // sheet.enableSheetCalculations();

//     // //Set data in the worksheet.
//     // sheet.getRangeByName('A1').columnWidth = 4.82;
//     // sheet.getRangeByName('B1:C1').columnWidth = 13.82;
//     // sheet.getRangeByName('D1').columnWidth = 13.20;
//     // sheet.getRangeByName('E1').columnWidth = 7.50;
//     // sheet.getRangeByName('F1').columnWidth = 9.73;
//     // sheet.getRangeByName('G1').columnWidth = 8.82;
//     // sheet.getRangeByName('H1').columnWidth = 4.46;

//     // sheet.getRangeByName('A1:H1').cellStyle.backColor = '#333F4F';
//     // sheet.getRangeByName('A1:H1').merge();
//     // sheet.getRangeByName('B4:D6').merge();

//     // sheet.getRangeByName('B4').setText('Invoice');
//     // sheet.getRangeByName('B4').cellStyle.fontSize = 32;

//     // sheet.getRangeByName('B8').setText('BILL TO:');
//     // sheet.getRangeByName('B8').cellStyle.fontSize = 9;
//     // sheet.getRangeByName('B8').cellStyle.bold = true;

//     // sheet.getRangeByName('B9').setText('Abraham Swearegin');
//     // sheet.getRangeByName('B9').cellStyle.fontSize = 12;

//     // sheet
//     //     .getRangeByName('B10')
//     //     .setText('United States, California, San Mateo,');
//     // sheet.getRangeByName('B10').cellStyle.fontSize = 9;

//     // sheet.getRangeByName('B11').setText('9920 BridgePointe Parkway,');
//     // sheet.getRangeByName('B11').cellStyle.fontSize = 9;

//     // sheet.getRangeByName('B12').setNumber(9365550136);
//     // sheet.getRangeByName('B12').cellStyle.fontSize = 9;
//     // sheet.getRangeByName('B12').cellStyle.hAlign = xls.HAlignType.left;

//     // final xls.Range range1 = sheet.getRangeByName('F8:G8');
//     // final xls.Range range2 = sheet.getRangeByName('F9:G9');
//     // final xls.Range range3 = sheet.getRangeByName('F10:G10');
//     // final xls.Range range4 = sheet.getRangeByName('F11:G11');
//     // final xls.Range range5 = sheet.getRangeByName('F12:G12');

//     // range1.merge();
//     // range2.merge();
//     // range3.merge();
//     // range4.merge();
//     // range5.merge();

//     // sheet.getRangeByName('F8').setText('INVOICE#');
//     // range1.cellStyle.fontSize = 8;
//     // range1.cellStyle.bold = true;
//     // range1.cellStyle.hAlign = xls.HAlignType.right;

//     // sheet.getRangeByName('F9').setNumber(2058557939);
//     // range2.cellStyle.fontSize = 9;
//     // range2.cellStyle.hAlign = xls.HAlignType.right;

//     // sheet.getRangeByName('F10').setText('DATE');
//     // range3.cellStyle.fontSize = 8;
//     // range3.cellStyle.bold = true;
//     // range3.cellStyle.hAlign = xls.HAlignType.right;

//     // sheet.getRangeByName('F11').dateTime = DateTime(2020, 08, 31);
//     // sheet.getRangeByName('F11').numberFormat =
//     //     '[\$-x-sysdate]dddd, mmmm dd, yyyy';
//     // range4.cellStyle.fontSize = 9;
//     // range4.cellStyle.hAlign = xls.HAlignType.right;

//     // range5.cellStyle.fontSize = 8;
//     // range5.cellStyle.bold = true;
//     // range5.cellStyle.hAlign = xls.HAlignType.right;

//     // final xls.Range range6 = sheet.getRangeByName('B15:G15');
//     // range6.cellStyle.fontSize = 10;
//     // range6.cellStyle.bold = true;

//     // sheet.getRangeByIndex(15, 2).setText('Code');
//     // sheet.getRangeByIndex(16, 2).setText('CA-1098');
//     // sheet.getRangeByIndex(17, 2).setText('LJ-0192');
//     // sheet.getRangeByIndex(18, 2).setText('So-B909-M');
//     // sheet.getRangeByIndex(19, 2).setText('FK-5136');
//     // sheet.getRangeByIndex(20, 2).setText('HL-U509');

//     // sheet.getRangeByIndex(15, 3).setText('Description');
//     // sheet.getRangeByIndex(16, 3).setText('AWC Logo Cap');
//     // sheet.getRangeByIndex(17, 3).setText('Long-Sleeve Logo Jersey, M');
//     // sheet.getRangeByIndex(18, 3).setText('Mountain Bike Socks, M');
//     // sheet.getRangeByIndex(19, 3).setText('ML Fork');
//     // sheet.getRangeByIndex(20, 3).setText('Sports-100 Helmet, Black');

//     // sheet.getRangeByIndex(15, 3, 15, 4).merge();
//     // sheet.getRangeByIndex(16, 3, 16, 4).merge();
//     // sheet.getRangeByIndex(17, 3, 17, 4).merge();
//     // sheet.getRangeByIndex(18, 3, 18, 4).merge();
//     // sheet.getRangeByIndex(19, 3, 19, 4).merge();
//     // sheet.getRangeByIndex(20, 3, 20, 4).merge();

//     // sheet.getRangeByIndex(15, 5).setText('Quantity');
//     // sheet.getRangeByIndex(16, 5).setNumber(2);
//     // sheet.getRangeByIndex(17, 5).setNumber(3);
//     // sheet.getRangeByIndex(18, 5).setNumber(2);
//     // sheet.getRangeByIndex(19, 5).setNumber(6);
//     // sheet.getRangeByIndex(20, 5).setNumber(1);

//     // sheet.getRangeByIndex(15, 6).setText('Price');
//     // sheet.getRangeByIndex(16, 6).setNumber(8.99);
//     // sheet.getRangeByIndex(17, 6).setNumber(49.99);
//     // sheet.getRangeByIndex(18, 6).setNumber(9.50);
//     // sheet.getRangeByIndex(19, 6).setNumber(175.49);
//     // sheet.getRangeByIndex(20, 6).setNumber(34.99);

//     // sheet.getRangeByIndex(15, 7).setText('Total');
//     // sheet.getRangeByIndex(16, 7).setFormula('=E16*F16+(E16*F16)');
//     // sheet.getRangeByIndex(17, 7).setFormula('=E17*F17+(E17*F17)');
//     // sheet.getRangeByIndex(18, 7).setFormula('=E18*F18+(E18*F18)');
//     // sheet.getRangeByIndex(19, 7).setFormula('=E19*F19+(E19*F19)');
//     // sheet.getRangeByIndex(20, 7).setFormula('=E20*F20+(E20*F20)');
//     // sheet.getRangeByIndex(15, 6, 20, 7).numberFormat = '\$#,##0.00';

//     // sheet.getRangeByName('E15:G15').cellStyle.hAlign = xls.HAlignType.right;
//     // sheet.getRangeByName('B15:G15').cellStyle.fontSize = 10;
//     // sheet.getRangeByName('B15:G15').cellStyle.bold = true;
//     // sheet.getRangeByName('B16:G20').cellStyle.fontSize = 9;

//     // sheet.getRangeByName('E22:G22').merge();
//     // sheet.getRangeByName('E22:G22').cellStyle.hAlign = xls.HAlignType.right;
//     // sheet.getRangeByName('E23:G24').merge();

//     // final xls.Range range7 = sheet.getRangeByName('E22');
//     // final xls.Range range8 = sheet.getRangeByName('E23');
//     // range7.setText('TOTAL');
//     // range7.cellStyle.fontSize = 8;
//     // range8.setFormula('=SUM(G16:G20)');
//     // range8.numberFormat = '\$#,##0.00';
//     // range8.cellStyle.fontSize = 24;
//     // range8.cellStyle.hAlign = xls.HAlignType.right;
//     // range8.cellStyle.bold = true;

//     // sheet.getRangeByIndex(26, 1).text =
//     //     '800 Interchange Blvd, Suite 2501, Austin, TX 78721 | support@adventure-works.com';
//     // sheet.getRangeByIndex(26, 1).cellStyle.fontSize = 8;

//     // final xls.Range range9 = sheet.getRangeByName('A26:H27');
//     // range9.cellStyle.backColor = '#ACB9CA';
//     // range9.merge();
//     // range9.cellStyle.hAlign = xls.HAlignType.center;
//     // range9.cellStyle.vAlign = xls.VAlignType.center;

//     // //final Picture picture = sheet.pictures.addBase64(3, 4, _invoicejpeg);
//     // // picture.lastRow = 7;
//     // // picture.lastColumn = 8;

//     // //Save and launch the excel.
//     // final List<int> bytes = workbook.saveAsStream();
//     // //Dispose the document.
//     // workbook.dispose();
//     // //Save and launch file.

//     // SaveFilehelper.saveAndOpenFile(bytes);
//   }

//   Future get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();

//     return directory.path;
//   }

//   Future get _localFile async {
//     final path = await _localPath;
//     Get.snackbar(path.toString(), path.toString());
//     return File('$path/45angle.txt');
//   }

//   Future writeAngle(String xyz) async {
//     final file = await _localFile;
//     Get.snackbar(file.toString(), file.toString());
// // Write the file
//     return file.writeAsString('$xyz');
//   }
  double yaxis = 0.0;
  late bool isneg;
  var time = 0.obs;
  bool accident = false;
  _Timer() {
    final periodictimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time.value++;
      if (time.value == 50) {
        timer.cancel();
      }
    });
  }

  int cnt = 0;
  List<String> hitobject = [];
  _makeStream() {
    strm = accelerometerEvents.listen((event) {});

    _startStream();
  }

  List<StoreAngle> anglelist = [];
  SaveDataSet() async {
    anglelist.forEach((element) async {
      try {
        var response = await http.post(Uri.parse(MyUrl.Url + "/CreateCsv"),
            headers: <String, String>{
              'Content-Type': 'application/json;charset=UTF-8'
            },
            body: jsonEncode(element.toMap()));
        if (response.statusCode == 200) {
          itr.value++;
        }
      } catch (e) {}
    });
    anglelist.clear();
    print("now");
    await Future.delayed(Duration(seconds: 8));
    _makeStream();
  }

  var itr = 0.obs;
  var x = 0.0.obs;
  var y = 0.0.obs;
  var z = 0.0.obs;
  var edge = "".obs;
  var fleft = Colors.transparent.obs;
  var fright = Colors.transparent.obs;
  var bleft = Colors.transparent.obs;
  var bright = Colors.transparent.obs;
  var cabin = Colors.transparent.obs;

  _startStream() async {
    strm.onData((data) async {
      x.value = data.x;
      y.value = data.y;
      z.value = data.z;
      var x_is_neg = false.obs;
      var y_is_neg = false.obs;
      var z_is_neg = false.obs;

      var magnitude = math.sqrt(
          ((x.value * x.value) + (y.value * y.value) + (z.value * z.value)));
      //Edge Up Checking

// //1=====>Which Edge Is Up
//       if (y.value > 0 && x.value > 0) {
//         edge.value = "Right";
//       }

//       if (x.value < 0 && y.value > 0) {
//         edge.value = "Left";
//       }
      StoreAngle stangle =
          StoreAngle(x: x.value, y: y.value, z: z.value, angle: "330");
      if (anglelist.length <= 99) {
        anglelist.add(stangle);
      } else {
        strm.cancel();
        print(anglelist.length);
        showDialog(
            barrierDismissible: false,
            context: Get.context as BuildContext,
            builder: (cnt) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //     padding: EdgeInsets.only(left: 20, right: 20),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(50),
                        //         color: Colors.grey[200],
                        //         boxShadow: [
                        //           BoxShadow(
                        //               offset: Offset(0, 10),
                        //               blurRadius: 50,
                        //               color: Color(0xffEEEEEE)),
                        //         ]),
                        //     alignment: Alignment.center,
                        //     child:
                        //     TextFormField(
                        //       controller: txtang,
                        //       keyboardType: TextInputType.number,
                        //     )),
                        TextButton(
                            onPressed: () async {
                              SaveDataSet();
                              Get.back();
                              // if (txtang.text.isNotEmpty) {
                              //   Get.back();
                              // } else {
                              //   Get.snackbar("Kindly Provide Angle", "");
                              // }
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ))
                      ],
                    ),
                  ));
            });
      }

      print(anglelist.length);
      if (magnitude > 25 && accident == false) {
        // strm.pause();

        // accident = true;

        await strm.cancel();

        Get.snackbar("Detected", "Detected");

        if (x.value < 0) {
          x.value = -1 * (x.value);
          x_is_neg.value = true;
        }
        if (y.value < 0) {
          y.value = -1 * (y.value);
          y_is_neg.value = true;
        }
        if (z.value < 0) {
          z.value = -1 * (z.value);
          z_is_neg.value = true;
        }

        //******************* */
        // if (y.value > 0 && x.value > 0) {
        //   edge.value = "Right";
        // }

        // if (x_is_neg.value && y.value > 0) {
        //   edge.value = "Left";
        // }
// 2===> on the basis of edge checking which side is hitted

        // if (edge.value == "Right") {
        //******************* */
        if (x.value > y.value) {
          if (x_is_neg.value) {
            Get.snackbar("Moving Left", "Moving Left");
            if (y_is_neg.value) {
              if (y.value > 1) {
                fleft.value = Colors.teal;
                fright.value = Colors.transparent;
                bleft.value = Colors.transparent;
                bright.value = Colors.transparent;
                cabin.value = Colors.transparent;
                Get.snackbar(
                    "Moving Left  Front Forward", "Moving  Left Front Forward");
              } else {
                if (y.value <= 1) {
                  bleft.value = Colors.transparent;
                  bright.value = Colors.transparent;
                  fleft.value = Colors.transparent;
                  fright.value = Colors.transparent;
                  cabin.value = Colors.teal;
                  Get.snackbar(
                      "Cabin Left  Back Backward", "Cabin  Left Back Backward");
                }
              }
            } else {
              if (y.value > 1) {
                bleft.value = Colors.teal;
                bright.value = Colors.transparent;
                fleft.value = Colors.transparent;
                fright.value = Colors.transparent;
                cabin.value = Colors.transparent;
                Get.snackbar(
                    "Moving Left  Back Backward", "Moving  Left Back Backward");
              } else {
                if (y.value <= 1) {
                  bleft.value = Colors.transparent;
                  bright.value = Colors.transparent;
                  fleft.value = Colors.transparent;
                  fright.value = Colors.transparent;
                  cabin.value = Colors.teal;
                  Get.snackbar(
                      "Cabin Left  Front Forward", "Cabin Left Front Forward");
                }
              }
            }
          } else {
            Get.snackbar("Moving Right", "Moving Right");
            if (y_is_neg.value) {
              if (y.value > 1) {
                fright.value = Colors.teal;
                fleft.value = Colors.transparent;
                bright.value = Colors.transparent;
                bleft.value = Colors.transparent;
                cabin.value = Colors.transparent;
                Get.snackbar("Moving Right  Front Forward",
                    "Moving  Right Front Forward");
              } else {
                bleft.value = Colors.transparent;
                bright.value = Colors.transparent;
                fleft.value = Colors.transparent;
                fright.value = Colors.transparent;
                cabin.value = Colors.teal;
                Get.snackbar(
                    "Cabin Right  Front Forward", "Cabin  Right Front Forward");
              }
            } else {
              if (y.value > 1) {
                bright.value = Colors.teal;
                bleft.value = Colors.transparent;
                fleft.value = Colors.transparent;
                fright.value = Colors.transparent;
                cabin.value = Colors.transparent;
                Get.snackbar("Moving Right  Back Backward",
                    "Moving  Right Back Backward");
              } else {
                bleft.value = Colors.transparent;
                bright.value = Colors.transparent;
                fleft.value = Colors.transparent;
                fright.value = Colors.transparent;
                cabin.value = Colors.teal;
                Get.snackbar(
                    "Cabin Right  Back Backward", "Cabin  Right Back Backward");
              }
            }
          }
        } else if (y.value > x.value) {
          if (y_is_neg.value) {
            Get.snackbar("Moving Front Forward", "Moving Front Forward");
            if (x_is_neg.value) {
              if (x.value < 2) {
                Get.snackbar("Head On Collision", "Front");
              } else {
                fleft.value = Colors.teal;
                fright.value = Colors.transparent;
                bleft.value = Colors.transparent;
                bright.value = Colors.transparent;
                cabin.value = Colors.transparent;
                Get.snackbar(
                    "Moving  Front Left Forward", "Moving  Front Left Forward");
              }
            } else {
              if (x.value < 2) {
                Get.snackbar("Head On Collision", "Front");
              } else {
                fright.value = Colors.teal;
                fleft.value = Colors.transparent;
                bleft.value = Colors.transparent;
                bright.value = Colors.transparent;
                cabin.value = Colors.transparent;
                Get.snackbar("Moving  Front Right Forward",
                    "Moving  Front Right Forward");
              }
            }
          } else {
            Get.snackbar("Moving Back Backward", "Moving Back Backward");
            if (x_is_neg.value) {
              if (x.value < 2) {
                Get.snackbar("Reverse Collision", "Back");
              } else {
                bleft.value = Colors.teal;
                bright.value = Colors.transparent;
                fleft.value = Colors.transparent;
                fright.value = Colors.transparent;
                cabin.value = Colors.transparent;
                Get.snackbar(
                    "Moving  Back Left Backward", "Moving  Back Left Backward");
              }
            } else {
              if (x.value < 2) {
                Get.snackbar("Reverse Collision", "Back");
              } else {
                bright.value = Colors.teal;
                bleft.value = Colors.transparent;
                fleft.value = Colors.transparent;
                fright.value = Colors.transparent;
                cabin.value = Colors.transparent;
                Get.snackbar("Moving  Back Right Backward",
                    "Moving  Back Right Backward");
              }
            }
          }
        }
        yaxis = y.value;
        isneg = y_is_neg.value;
        //_AfterAccidentSpeedObserver(yaxis: y.value, isneg: y_is_neg.value);
        x.value = 0;
        y.value = 0;
        z.value = 0;
        // await Future.delayed(const Duration(seconds: 3));
        // await const Duration(seconds: 5).delay();
        _makeStream();
      } else if (accident) {
        double y = 0;
        bool negy = false;

        if (cnt < 20) {
          if (data.y < 0) {
            negy = true;
            y = -1 * (data.y);
          } else {
            y = data.y;
          }
          if (y > 0 && y <= 1) {
            if (yaxis < y && isneg && negy) {
              hitobject.add("Smaller");
            } else if (yaxis > y && isneg && negy) {
              hitobject.add("Medium");
            } else if (yaxis < y && isneg && !(negy)) {
              hitobject.add("Bigger");
            } else if (yaxis < y && !(isneg) && negy) {
              hitobject.add("Bigger");
            } else if (yaxis > y && isneg && !(negy)) {
              hitobject.add("Bigger");
            } else if (yaxis > y && !(isneg) && negy) {
              hitobject.add("Bigger");
            }
            cnt++;
          } else {
            hitobject.add("Same");
            cnt++;
          }
        } else {
          print(hitobject.join().toString());
          strm.cancel();
        }
      }
    });
  }

  // _AfterAccidentSpeedObserver(
  //     {required double yaxis, required bool isneg}) async {
  //   int cnt = 0;
  //   double y = 0;
  //   bool negy = false;
  //   List<String> hitobject = [];

  //   st = accelerometerEvents.listen((event) {
  //     print(event.x);
  //   });
  //   st.onData((data) {
  //     if (cnt < 20) {
  //       if (data.y < 0) {
  //         negy = true;
  //         y = -1 * (data.y);
  //       } else {
  //         y = data.y;
  //       }
  //       if (y > 0 && y <= 1) {
  //         if (yaxis < y && isneg && negy) {
  //           hitobject.add("Smaller");
  //         } else if (yaxis > y && isneg && negy) {
  //           hitobject.add("Medium");
  //         } else if (yaxis < y && isneg && !(negy)) {
  //           hitobject.add("Bigger");
  //         } else if (yaxis < y && !(isneg) && negy) {
  //           hitobject.add("Bigger");
  //         } else if (yaxis > y && isneg && !(negy)) {
  //           hitobject.add("Bigger");
  //         } else if (yaxis > y && !(isneg) && negy) {
  //           hitobject.add("Bigger");
  //         }
  //         cnt++;
  //       } else {
  //         hitobject.add("Same Object");
  //         cnt++;
  //       }
  //     } else {
  //       st.cancel();
  //     }
  //   });
  //   print(hitobject.toString());
  // }
//   Future<void> DetectAccidentGetAngle(
//     double x,
//     double y,
//     double z,
//   ) async {
//     var x_is_neg = false.obs;
//     var y_is_neg = false.obs;
//     var z_is_neg = false.obs;

//     var magnitude = math.sqrt(((x * x) + (y * y) + (z * z)));

//     if (magnitude > 20) {
//       await strm.cancel();
//       Get.snackbar("Detected", "Detected");

//       if (x < 0) {
//         x = -1 * (x);
//         x_is_neg.value = true;
//       }
//       if (y < 0) {
//         y = -1 * (y);
//         y_is_neg.value = true;
//       }
//       if (z < 0) {
//         z = -1 * (z);
//         z_is_neg.value = true;
//       }

// //Max Calculation and side detection

//       if (x > y) {
//         if (x_is_neg.value) {
//           Get.snackbar("Left Side        X Negative", "X=${x} Y=${y} Z=${z}",
//               duration: const Duration(seconds: 5));
//         } else {
//           Get.snackbar(
//               " Right Side                  X Positive", "X=${x} Y=${y} Z=${z}",
//               duration: const Duration(seconds: 5));
//         }
//       }

//       // else if (y > x) {
//       //   if (y_is_neg.value) {
//       //     Get.snackbar("Back Side        Y Negative", "X=${x} Y=${y} Z=${z}",
//       //         duration: const Duration(seconds: 5));
//       //   } else {
//       //     Get.snackbar("Front Side        Y Positive", "X=${x} Y=${y} Z=${z}",
//       //         duration: const Duration(seconds: 5));
//       //   }
//       // }
//     }
//     _startStream();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        SaveDataSet();
      }),
      appBar: AppBar(
        title: Obx(() => Text(
              "$itr",
              style: TextStyle(fontSize: 17),
            )),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body:
          //      SafeArea(
          //         child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Obx(() => Center(
          //           child: Text(
          //             "${time.value}",
          //             style: TextStyle(
          //                 fontSize: 30,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.red),
          //           ),
          //         ))
          //   ],
          // )));
          SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/degreegraph.jpeg",
                ),
              ],
            ),
          ),
          // Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Obx(() => Container(
          //               height: 180,
          //               width: (MediaQuery.of(context).size.width / 2) - 10,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Icon(
          //                     Icons.arrow_circle_right,
          //                     color: Colors.white,
          //                     size: 50,
          //                   ),
          //                   Text(
          //                     "Left",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20),
          //                   )
          //                 ],
          //               ),
          //               decoration: BoxDecoration(
          //                   color: fleft.value,
          //                   borderRadius: BorderRadius.circular(10)),
          //             )),
          //         Obx(() => Container(
          //               height: 180,
          //               width: (MediaQuery.of(context).size.width / 2) - 10,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Icon(
          //                     Icons.arrow_circle_right,
          //                     color: Colors.white,
          //                     size: 50,
          //                   ),
          //                   Text(
          //                     "Right",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20),
          //                   )
          //                 ],
          //               ),
          //               decoration: BoxDecoration(
          //                   color: fright.value,
          //                   borderRadius: BorderRadius.circular(10)),
          //             )),
          //       ],
          //     ),
          //     Obx(() => Container(
          //           margin: EdgeInsets.only(top: 30),
          //           height: 250,
          //           width: MediaQuery.of(context).size.width,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               Icon(
          //                 Icons.arrow_circle_right,
          //                 color: Colors.white,
          //                 size: 50,
          //               ),
          //               Text(
          //                 "Cabin",
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 20),
          //               )
          //             ],
          //           ),
          //           decoration: BoxDecoration(
          //               color: cabin.value,
          //               borderRadius: BorderRadius.circular(10)),
          //         )),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Obx(() => Container(
          //               margin: EdgeInsets.only(top: 30),
          //               height: 180,
          //               width: (MediaQuery.of(context).size.width / 2) - 10,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Icon(
          //                     Icons.arrow_circle_right,
          //                     color: Colors.white,
          //                     size: 50,
          //                   ),
          //                   Text(
          //                     "Left",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20),
          //                   )
          //                 ],
          //               ),
          //               decoration: BoxDecoration(
          //                   color: bleft.value,
          //                   borderRadius: BorderRadius.circular(10)),
          //             )),
          //         Obx(() => Container(
          //               margin: EdgeInsets.only(top: 30),
          //               height: 180,
          //               width: (MediaQuery.of(context).size.width / 2) - 10,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                   Icon(
          //                     Icons.arrow_circle_right,
          //                     color: Colors.white,
          //                     size: 50,
          //                   ),
          //                   Text(
          //                     "Right",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20),
          //                   )
          //                 ],
          //               ),
          //               decoration: BoxDecoration(
          //                   color: bright.value,
          //                   borderRadius: BorderRadius.circular(10)),
          //             )),
          //       ],
          //     ),
          //   ],
          // ),
        ),
      )),
    );
    //     Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         SafeArea(
    //           child: Container(
    //             height: MediaQuery.of(context).size.height,
    //             width: MediaQuery.of(context).size.width,
    //             color: Colors.blueAccent,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Obx(() => Text(
    //                       "x=${x.value}  y=${y.value}   z=${z.value} ",
    //                       style: const TextStyle(
    //                           color: Colors.black, fontWeight: FontWeight.bold),
    //                     )),
    //                 Obx(() => Text(
    //                       edge.value,
    //                       style: const TextStyle(
    //                           color: Colors.red,
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 30),
    //                     ))
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

//  if (z.value > 0) {
//           Get.snackbar("Z",
//               "Greater then or equal to Zero  ${x.value} ${y.value} ${z.value}");
//           if (x > 0) {
//             Get.snackbar("Left", "Left");
//           }
//         } else if (z.value < 0) {
//           Get.snackbar("Z", "Less then  Zero ${x.value} ${y.value} ${z.value}");
//           if (x < 0) {
//             Get.snackbar("Left", "Left");
//           }
//         }
