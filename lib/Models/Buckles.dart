class BucklePoints {
  late double bucklepointabs;
  late String bucklepoint;
  BucklePoints();
  BucklePoints.FromMap(Map<String, dynamic> mp) {
    bucklepoint = mp["bucklepoint"];
    bucklepointabs = mp["bucklepointabs"];
  }
}
