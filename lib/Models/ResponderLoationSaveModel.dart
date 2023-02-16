class ResponderLocationTrackSaveLocation {
  late int cid, nid, rltid;
  // late String cphno, cname;
  late double longitude, latitude;

  ResponderLocationTrackSaveLocation(
      {required this.latitude,
      required this.longitude,
      required this.cid,
      required this.nid,
      required this.rltid});

  Map<String, dynamic> toMap() => <String, dynamic>{
        'cid': cid,
        'nid': nid,
        'rltid': rltid,
        'latitude': latitude,
        'longitude': longitude,
      };

  ResponderLocationTrackSaveLocation.fromMap(Map<String, dynamic> mp) {
    cid = mp["cid"];
    latitude = mp["latitude"];
    longitude = mp["longitude"];
    rltid = mp["rltid"];
    nid = mp["nid"];
  }
}
