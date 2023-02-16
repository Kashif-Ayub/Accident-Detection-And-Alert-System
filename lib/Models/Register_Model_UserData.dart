class Register_User {
  late String uname;
  late String phno;
  late String password;
  late String vnumber;
  late String vtype;

  Register_User(
      {required this.uname,
      required this.phno,
      required this.password,
      required this.vnumber,
      required this.vtype});
  Map<String, dynamic> toMap() => {
        "uname": uname,
        "phno": phno,
        "password": password,
        "vnumber": vnumber,
        "vtype": vtype
      };
}
