import 'package:bloc_code/Feature/ShopScreen/domain/entities/shop_entity.dart';
import 'package:bloc_code/Feature/ShopScreen/domain/useCases/shop_usecase.dart';
import 'package:bloc_code/Feature/ShopScreen/presentation/cubit/shop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopState> {
  final ShopUsecase shopUsecase;

  ShopCubit({required this.shopUsecase}):super(ShopInitState());

  Future<void>getShopList(String endpoint)async {

    try {
      emit(ShopLoadingState());
      var response = await shopUsecase.getShopList(endpoint);
      response.fold((failure){
        emit(ShopErrorState(message: failure.message));
      },(data){
        emit(ShopSucessState(shopEntity: data));
      });
    } catch (e) {
      emit(ShopErrorState(message: e.toString()));
    }
  }
  void incrementQty(int index) {
    if (state is! ShopSucessState) return;

    final currentState = state as ShopSucessState;
    final products = currentState.shopEntity.shop;

    final product = products[index];
    final maxQty = product.maxPurchaseQty;

    if (product.qty >= maxQty) return;

    final updatedProduct = product.copyWith(qty: product.qty + 1);
    _updateProductList(index, updatedProduct, currentState);
  }

  void decrementQty(int index) {
    if (state is! ShopSucessState) return;

    final currentState = state as ShopSucessState;
    final products = currentState.shopEntity.shop;

    final product = products[index];
    if (product.qty <= 0) return;

    final updatedProduct = product.copyWith(qty: product.qty - 1);
    _updateProductList(index, updatedProduct, currentState);
  }

  void _updateProductList(
      int index,
      ShopDataEntity updated,
      ShopSucessState currentState,
      ) {
    final updatedList = List<ShopDataEntity>.from(
      currentState.shopEntity.shop,
    );

    updatedList[index] = updated;

    final updatedEntity = currentState.shopEntity.copyWith(
      shop: updatedList,
    );

    emit(ShopSucessState(shopEntity: updatedEntity));
  }

}