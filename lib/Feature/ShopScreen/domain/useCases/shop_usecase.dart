import 'package:bloc_code/Feature/ShopScreen/domain/entities/shop_entity.dart';
import 'package:bloc_code/Feature/ShopScreen/domain/repository/shop_repository.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class ShopUsecase {
  final ShopRepository shopRepository;
  ShopUsecase({required this.shopRepository});

  Future<Either<Failure, ShopEntity>> getShopList(String endpoint) async {
    return shopRepository.getShopList(endpoint);
  }

 }