class Transactions {
  List<Data>? data;

  Transactions({this.data});

  Transactions.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? sId;
  String? userId;
  String? userUniqueCode;
  String? transactionType;
  String? transactionCost;
  String? paiementScreenShot;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? wallet ; 

  Data(
      {this.status,
      this.sId,
      this.userId,
      this.userUniqueCode,
      this.transactionType,
      this.transactionCost,
      this.paiementScreenShot,
      this.createdAt,
      this.updatedAt,
      this.wallet,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    userId = json['userId'];
    userUniqueCode = json['userUniqueCode'];
    transactionType = json['transactionType'];
    transactionCost = json['transactionCost'];
    paiementScreenShot = json['paiementScreenShot'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['userUniqueCode'] = this.userUniqueCode;
    data['transactionType'] = this.transactionType;
    data['transactionCost'] = this.transactionCost;
    data['paiementScreenShot'] = this.paiementScreenShot;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['wallet'] = this.wallet; 
    return data;
  }
}