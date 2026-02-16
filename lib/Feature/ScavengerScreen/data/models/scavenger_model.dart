import 'package:bloc_code/Feature/ScavengerScreen/domain/entities/scavenger_entity.dart';

class ScavengerModel extends ScavengerEntity {

  ScavengerModel({
    required super.jsonStatus,
    required super.msg,
    required super.data,
    required super.empName,
    required super.phone,
    required super.mail,
    required super.shop,
  });

  factory ScavengerModel.fromJson(Map<String, dynamic> json) => ScavengerModel(
    jsonStatus: json["json_status"],
    msg: json["msg"],
    data: List<dataModel>.from(json["data"].map((x) => dataModel.fromJson(x))),
    empName: json["emp_name"],
    phone: json["phone"],
    mail: json["mail"],
    shop: json["shop"],
  );

}

class dataModel extends DataEntity {
  dataModel({
    required super.t,
    required super.p,
    required super.r,
    required super.h,
    required super.c,
    required super.qr,
    required super.img,
    required super.noQr,
  });

  factory dataModel.fromJson(Map<String, dynamic> json) => dataModel(
    t: json["t"],
    p: json["p"],
    r: json["r"],
    h: json["h"],
    c: json["c"],
    qr: json["qr"],
    img: json["img"],
    noQr: json["no_qr"],
  );

}
