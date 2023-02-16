import 'package:fyp_accident_detection_and_alert_system/Models/Register_Model_CarType.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../Models/Contact_Model.dart';
import 'Dashboard_Screen_Controller.dart';
import '../Models/ModifyModel.dart';

final LocationSettings locationSettings =
    LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 10);
var Victim_car = "".obs;

var HitSide = "".obs;
var Total_Force = 0.0.obs;
var ForceOnCabin = 0.0.obs;
var Acc_lat, Acc_long, Victim_Name, phoneofvictim, victimuid;
var clist = List<EmergencyContacts>.empty().obs;
var threshold = 0.0.obs;
var ambulance_flag = false.obs;
final n_lat = 0.0.obs;
final n_long = 0.0.obs;
var start_lat = 0.0.obs;
var start_long = 0.0.obs;
var a_lat = 0.0.obs;
var a_long = 0.0.obs;
late var dash_controller1;
var timeInterval = 0.0.obs;
late String date = "";
late String ntime = "";
int notiid = 0;
var bpval = 0.0.obs;
bool modifyflag = false;
late String userCar;
List<CarType> Ucars = [];
var Selected_val_car = "".obs;
late var wireframe = ModifyModel(
        bpid: 0,
        vid: 0,
        doors: 0,
        roof: 0,
        engine: 0,
        fbumper: 0,
        rbumper: 0,
        fleft1: 0,
        fleft2: 0,
        fleft3: 0,
        fleft4: 0,
        fleft5: 0,
        fleft6: 0,
        fleft7: 0,
        fleft8: 0,
        fleft9: 0,
        fleft10: 0,
        rleft1: 0,
        rleft2: 0,
        rleft3: 0,
        rleft4: 0,
        rleft5: 0,
        rleft6: 0)
    .obs;
