class EmergencyContacts {
  late int cid;
  late int uid;
  late String cname;
  late String cphno;

  EmergencyContacts(
      {required this.cid,
      required this.uid,
      required this.cname,
      required this.cphno});
  Map<String, dynamic> toMap() =>
      {'cid': cid, 'uid': uid, 'cname': cname, 'cphno': cphno};

  EmergencyContacts.fromMap(Map<String, dynamic> mp) {
    cid = mp["cid"];
    uid = mp["uid"];
    cname = mp["cname"];
    cphno = mp["cphno"];
  }
}
