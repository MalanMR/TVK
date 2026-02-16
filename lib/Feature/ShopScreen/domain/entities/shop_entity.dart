import 'package:equatable/equatable.dart';

class ShopEntity extends Equatable {
  int jsonStatus;
  String msg;
  int points;
  List<ShopDataEntity> shop;

  ShopEntity({
    required this.jsonStatus,
    required this.msg,
    required this.points,
    required this.shop,
  });

  ShopEntity copyWith({
    List<ShopDataEntity>? shop,
  }) {
    return ShopEntity(
      jsonStatus: jsonStatus,
      msg: msg,
      points: points,
      shop: shop ?? this.shop,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[jsonStatus,msg,points,shop];
}

class ShopDataEntity extends Equatable{
  int id;
  String name;
  int point;
  int stock;
  int remQty;
  int claim;
  int qty;
  String qr;
  String img;

  ShopDataEntity({
    required this.id,
    required this.name,
    required this.point,
    required this.stock,
    required this.remQty,
    required this.claim,
    required this.qty,
    required this.qr,
    required this.img,
  });

  int get maxPurchaseQty {
    const int maxAllowed = 5;

    final limitLeft = remQty - qty;
    print(limitLeft);
    //final allowed = stock < limitLeft ? stock : limitLeft;
        int allowed = stock < limitLeft ? stock : limitLeft;

    return allowed > 0 ? allowed : 0;
  }
  String get stockLabel {
    if (stock == 0) return "Out of Stock";
    if (stock <= 5) return "Hurry up! $stock left";
    return "In Stock";
  }

  bool get canClaim => claim == 0 && stock > 0;

  ShopDataEntity copyWith({
    int? id,
    String? name,
    int? point,
    int? stock,
    int? remQty,
    int? claim,
    int? qty,
    String? qr,
    String? img,
  }) {
    return ShopDataEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      point: point ?? this.point,
      stock: stock ?? this.stock,
      remQty: remQty ?? this.remQty,
      claim: claim ?? this.claim,
      qty: qty ?? this.qty,
      qr: qr ?? this.qr,
      img: img ?? this.img,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id,name,point,stock,remQty,claim,qty,qr,img];
}