class AccidentLocationTrack {
  late int altid, uid, nid;
  late double longitude, latitude;

  AccidentLocationTrack(
      {required this.altid,
      required this.uid,
      required this.latitude,
      required this.longitude,
      required this.nid});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'altid': altid,
        'uid': uid,
        'longitude': longitude,
        'latitude': latitude,
        'nid': nid
      };

  AccidentLocationTrack.fromMap(Map<String, dynamic> mp) {
    altid = mp["altid"];
    uid = mp["uid"];
    latitude = mp["latitude"];
    longitude = mp["longitude"];
    nid = mp["nid"];
  }
}
