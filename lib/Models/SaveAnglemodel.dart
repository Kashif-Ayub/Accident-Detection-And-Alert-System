class StoreAngle {
  late double x;
  late double y;
  late double z;
  late String angle;
  StoreAngle(
      {required this.x, required this.y, required this.z, required this.angle});
  Map<String, dynamic> toMap() =>
      <String, dynamic>{"x": x, "y": y, "z": z, 'angle': angle};
}
