import 'package:bloc_code/Feature/ShopScreen/domain/entities/shop_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ShopState extends Equatable{
  const ShopState();

  @override
  List<Object> get props =>[];
}

class ShopInitState extends ShopState{
  @override
  List<Object> get props => [];
}
class ShopLoadingState extends ShopState{
  @override
  List<Object> get props => [];
}

class ShopErrorState extends ShopState{
  final String message ;
  const ShopErrorState({required this.message});

}

class ShopSucessState extends ShopState{
  final ShopEntity shopEntity ;
   ShopSucessState({required this.shopEntity});

  @override
  List<Object> get props => [shopEntity]; // 🔥 THIS FIXES UI
}