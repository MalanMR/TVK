import 'package:bloc_code/Feature/ShopScreen/domain/entities/shop_entity.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ShopRepository {
  Future<Either<Failure,ShopEntity>> getShopList(String endpoint);
}