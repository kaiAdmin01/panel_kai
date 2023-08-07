class User {
  DataUser? data;

  User({this.data});

  User.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataUser {
  String? sId;
  String? email;
  String? username;
  String? password;
  bool? isAdmin;
  String? points;
  List<Null>? arrayAttribute;
  String? photo;
  String? idParent;
  String? uniqueCode;
  bool? active;
  String? machineStartDate;
  List<dynamic>? notifications;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Null>? machines;
  String? signedIn;
  int? activeChild;
  int? nbNotif ; 

  DataUser(
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
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.machines,
      this.signedIn,
      this.activeChild,
      this.nbNotif
      });

  DataUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    points = json['points'];
    
    photo = json['photo'];
    idParent = json['IdParent'];
    uniqueCode = json['uniqueCode'];
    active = json['active'];
    machineStartDate = json['machineStartDate'];
    notifications = json['notifications']; 
   
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
   
    signedIn = json['signedIn'];
    activeChild = json['activeChild'];
    nbNotif = json['nbNotif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['isAdmin'] = this.isAdmin;
    data['points'] = this.points;
    data['notifications'] = this.notifications ; 
    data['photo'] = this.photo;
    data['IdParent'] = this.idParent;
    data['uniqueCode'] = this.uniqueCode;
    data['active'] = this.active;
    data['machineStartDate'] = this.machineStartDate;
  
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
  
    data['signedIn'] = this.signedIn;
    data['activeChild'] = this.activeChild;
    data['nbNotif'] = this.nbNotif;
    return data;
  }
}