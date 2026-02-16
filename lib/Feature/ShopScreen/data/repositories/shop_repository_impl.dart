import 'package:bloc_code/Feature/ShopScreen/data/dataSource/shop_data_source.dart';
import 'package:bloc_code/Feature/ShopScreen/domain/entities/shop_entity.dart';
import 'package:bloc_code/Feature/ShopScreen/domain/repository/shop_repository.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class ShopRepositoryImpl extends ShopRepository{

  final ShopDataSource shopDataSource;
  ShopRepositoryImpl({required this.shopDataSource});

  @override
  Future<Either<Failure, ShopEntity>> getShopList(String endpoint) async {

    try{
      final response = await shopDataSource.getShopList(endpoint);

      if(response is ShopEntity){
        return Right(response);

      }else{
        return Left(Failure(message: response));
      }

    }catch(e){
      return Left(Failure(message: e.toString()));
    }
  }
}