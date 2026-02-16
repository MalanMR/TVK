import 'package:equatable/equatable.dart';

class ScavengerEntity extends Equatable {

  int jsonStatus;
  String msg;
  List<DataEntity> data;
  dynamic empName;
  dynamic phone;
  dynamic mail;
  dynamic shop;

  ScavengerEntity({
    required this.jsonStatus,
    required this.msg,
    required this.data,
    required this.empName,
    required this.phone,
    required this.mail,
    required this.shop,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [jsonStatus,msg,data,empName,phone,mail,shop];

}

class DataEntity extends Equatable {
  String t;
  String p;
  String r;
  String h;
  String c;
  String qr;
  String img;
  String noQr;

  DataEntity({
    required this.t,
    required this.p,
    required this.r,
    required this.h,
    required this.c,
    required this.qr,
    required this.img,
    required this.noQr,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>[t,p,r,h,c,qr,img,noQr];

}
