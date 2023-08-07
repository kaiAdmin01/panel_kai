class Users {
  List<Data>? data;

  Users({this.data});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? username;
  String? password;
  bool? isAdmin;
  String? points;
  List<String>? arrayAttribute;
  String? photo;
  String? idParent;
  String? uniqueCode;
  bool? active;
  String? machineStartDate;
  List<String>? notifications;
  String? level;
  int? monthlyIncome;
  double? globalDailyIncome;
  List<Machines>? machines;
  int? iV;
  String? pays;

  Data(
      {this.sId,
      this.email,
      this.username,
      this.password,
      this.isAdmin,
      this.points,
      this.arrayAttribute,
      this.photo,
      this.idParent,
      this.uniqueCode,
      this.active,
      this.machineStartDate,
      this.notifications,
      this.level,
      this.monthlyIncome,
      this.globalDailyIncome,
      this.machines,
      this.iV,
      this.pays});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    points = json['points'];
    arrayAttribute = json['arrayAttribute'].cast<String>();
    photo = json['photo'];
    idParent = json['IdParent'];
    uniqueCode = json['uniqueCode'];
    active = json['active'];
    machineStartDate = json['machineStartDate'];
    notifications = json['notifications'].cast<String>();
    level = json['level'];
    monthlyIncome = json['monthlyIncome'];
    globalDailyIncome = json['globalDailyIncome'];
    if (json['machines'] != null) {
      machines = <Machines>[];
      json['machines'].forEach((v) {
        machines!.add(new Machines.fromJson(v));
      });
    }
    iV = json['__v'];
    pays = json['pays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['isAdmin'] = this.isAdmin;
    data['points'] = this.points;
    data['arrayAttribute'] = this.arrayAttribute;
    data['photo'] = this.photo;
    data['IdParent'] = this.idParent;
    data['uniqueCode'] = this.uniqueCode;
    data['active'] = this.active;
    data['machineStartDate'] = this.machineStartDate;
    data['notifications'] = this.notifications;
    data['level'] = this.level;
    data['monthlyIncome'] = this.monthlyIncome;
    data['globalDailyIncome'] = this.globalDailyIncome;
    if (this.machines != null) {
      data['machines'] = this.machines!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['pays'] = this.pays;
    return data;
  }
}

class Machines {
  String? name;
  int? money;
  String? startDay;
  String? endDay;
  double? globalIncome;
  String? sId;
  double? dailyIncome;

  Machines(
      {this.name,
      this.money,
      this.startDay,
      this.endDay,
      this.globalIncome,
      this.sId,
      this.dailyIncome});

  Machines.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    money = json['money'];
    startDay = json['startDay'];
    endDay = json['endDay'];
    globalIncome = json['globalIncome'];
    sId = json['_id'];
    dailyIncome = json['dailyIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['money'] = this.money;
    data['startDay'] = this.startDay;
    data['endDay'] = this.endDay;
    data['globalIncome'] = this.globalIncome;
    data['_id'] = this.sId;
    data['dailyIncome'] = this.dailyIncome;
    return data;
  }
}