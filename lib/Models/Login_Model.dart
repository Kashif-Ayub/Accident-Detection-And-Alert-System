class LoginModel {
  late int uid;
  late String uname;
  late String role;

  LoginModel.fromMap(Map<String, dynamic> mp) {
    uid = mp["uid"];
    uname = mp["uname"];
    role = mp["role"];
  }
}
