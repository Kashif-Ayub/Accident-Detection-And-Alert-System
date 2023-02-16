class ResponderLocationTrack {
  late int uid, nid;
  late String cphno, cname;
  late double longitude, latitude;

  ResponderLocationTrack(
      {required this.cphno,
      required this.latitude,
      required this.longitude,
      required this.uid,
      required this.nid});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'uid': uid,
        'latitude': latitude,
        'longitude': longitude,
        'cphno': cphno,
        'nid': nid
      };

  ResponderLocationTrack.fromMap(Map<String, dynamic> mp) {
    cname = mp["cname"];
    latitude = mp["latitude"];
    longitude = mp["longitude"];
    cphno = mp["cphno"];
    nid = mp["nid"];
  }
}
