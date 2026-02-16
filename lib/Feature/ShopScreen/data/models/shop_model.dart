import 'package:bloc_code/Feature/ShopScreen/domain/entities/shop_entity.dart';

class ShopModel extends ShopEntity{

  ShopModel({
    required super.jsonStatus,
    required super.msg,
    required super.points,
    required super.shop,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
    jsonStatus: json["json_status"],
    msg: json["msg"],
    points: json["points"],
    shop: List<ShopDataModel>.from(json["shop"].map((x) => ShopDataModel.fromJson(x))),
  );

}

class ShopDataModel extends ShopDataEntity{

  ShopDataModel({
    required super.id,
    required super.name,
    required super.point,
    required super.stock,
    required super.remQty,
    required super.claim,
    required super.qty,
    required super.qr,
    required super.img,
  });

  factory ShopDataModel.fromJson(Map<String, dynamic> json) => ShopDataModel(
    id: json["id"],
    name: json["name"],
    point: json["point"],
    stock: json["stock"],
    remQty: json["rem_qty"],
    claim: json["claim"],
    qty: json["qty"],
    qr: json["qr"],
    img: json["img"],
  );

}
