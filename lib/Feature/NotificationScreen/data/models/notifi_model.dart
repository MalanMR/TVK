import 'package:bloc_code/Feature/NotificationScreen/domain/entities/notifi_entity.dart';

class NotifiModel extends NotifiEntity{

  NotifiModel({
    required super.jsonStatus,
    required super.msg,
    required super.data,
  });

  factory NotifiModel.fromJson(Map<String, dynamic> json) => NotifiModel(
    jsonStatus: json["json_status"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "json_status": jsonStatus,
  //   "msg": msg,
  //   "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class Datum extends NotifiData{

  Datum({
    required super.n,
    required super.t,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    n: json["n"],
    t: json["t"],
  );

  Map<String, dynamic> toJson() => {
    "n": n,
    "t": t,
  };
}