class CarType {
  late String vtype;
  CarType({required this.vtype});
  CarType.fromMap(Map<String, dynamic> mp) {
    vtype = mp["vtype"];
  }
}
