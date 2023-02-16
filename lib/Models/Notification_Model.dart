class Accident_Notification {
  late String uname,
      Message,
      uphno,
      hitside,
      car,
      accidentdate,
      accidenttime,
      status;
  late double speed, longitude, lattitude, forceoncabin, totalforce;
  late int nid, uid;
  Accident_Notification(
      {required this.nid,
      required this.uid,
      required this.forceoncabin,
      required this.Message,
      required this.speed,
      required this.longitude,
      required this.lattitude,
      required this.car,
      required this.hitside,
      required this.totalforce,
      required this.accidentdate,
      required this.accidenttime,
      required this.status});

  Map<String, dynamic> toMap() => <String, dynamic>{
        "nid": nid,
        "uid": uid,
        "forceoncabin": forceoncabin,
        "Message": Message,
        "speed": speed,
        "longitude": longitude,
        "latitude": lattitude,
        "totalforce": totalforce,
        "hitside": hitside,
        "car": car,
        "accidentdate": accidentdate,
        "accidenttime": accidenttime,
        "status": status
      };

  Accident_Notification.fromMap(Map<String, dynamic> mp) {
    uid = mp["uid"];
    nid = mp["nid"];
    uname = mp["uname"];
    uphno = mp["uphno"];
    forceoncabin = mp["forceoncabin"];
    Message = mp["Message"];
    speed = mp["speed"];
    longitude = mp["longitude"];
    lattitude = mp["latitude"];
    totalforce = mp["totalforce"];
    hitside = mp["hitside"];
    car = mp["car"];
    accidentdate = mp["accidentdate"];
    accidenttime = mp["accidenttime"];
    status = mp["status"];
  }
}
