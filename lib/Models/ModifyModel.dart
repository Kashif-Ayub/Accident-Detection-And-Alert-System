class ModifyModel {
  late int bpid;
  late int vid;
  late int doors;
  late double roof;
  late double engine;
  late double fbumper;
  late double rbumper;
  late double fleft1;
  late double fleft2;
  late double fleft3;
  late double fleft4;
  late double fleft5;
  late double fleft6;
  late double fleft7;
  late double fleft8;
  late double fleft9;
  late double fleft10;
  late double rleft1;
  late double rleft2;
  late double rleft3;
  late double rleft4;
  late double rleft5;
  late double rleft6;

  ModifyModel(
      {required this.bpid,
      required this.vid,
      required this.doors,
      required this.roof,
      required this.engine,
      required this.fbumper,
      required this.rbumper,
      required this.fleft1,
      required this.fleft2,
      required this.fleft3,
      required this.fleft4,
      required this.fleft5,
      required this.fleft6,
      required this.fleft7,
      required this.fleft8,
      required this.fleft9,
      required this.fleft10,
      required this.rleft1,
      required this.rleft2,
      required this.rleft3,
      required this.rleft4,
      required this.rleft5,
      required this.rleft6});

  ModifyModel.fromJson(Map<String, dynamic> json) {
    bpid = json['bpid'];
    vid = json['vid'];
    doors = json['doors'];
    roof = json['roof'];
    engine = json['engine'];
    fbumper = json['fbumper'];
    rbumper = json['rbumper'];
    fleft1 = json['fleft1'];
    fleft2 = json['fleft2'];
    fleft3 = json['fleft3'];
    fleft4 = json['fleft4'];
    fleft5 = json['fleft5'];
    fleft6 = json['fleft6'];
    fleft7 = json['fleft7'];
    fleft8 = json['fleft8'];
    fleft9 = json['fleft9'];
    fleft10 = json['fleft10'];
    rleft1 = json['rleft1'];
    rleft2 = json['rleft2'];
    rleft3 = json['rleft3'];
    rleft4 = json['rleft4'];
    rleft5 = json['rleft5'];
    rleft6 = json['rleft6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bpid'] = bpid;
    data['vid'] = vid;
    data['doors'] = doors;
    data['roof'] = roof;
    data['engine'] = engine;
    data['fbumper'] = fbumper;
    data['rbumper'] = rbumper;
    data['fleft1'] = fleft1;
    data['fleft2'] = fleft2;
    data['fleft3'] = fleft3;
    data['fleft4'] = fleft4;
    data['fleft5'] = fleft5;
    data['fleft6'] = fleft6;
    data['fleft7'] = fleft7;
    data['fleft8'] = fleft8;
    data['fleft9'] = fleft9;
    data['fleft10'] = fleft10;
    data['rleft1'] = rleft1;
    data['rleft2'] = rleft2;
    data['rleft3'] = rleft3;
    data['rleft4'] = rleft4;
    data['rleft5'] = rleft5;
    data['rleft6'] = rleft6;
    return data;
  }
}
