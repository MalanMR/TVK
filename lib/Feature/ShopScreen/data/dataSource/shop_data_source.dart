import 'dart:convert';
import 'package:bloc_code/Feature/ShopScreen/data/models/shop_model.dart';
import 'package:bloc_code/core/network/api_client.dart';

abstract class ShopDataSource {
  Future<dynamic> getShopList(String endpoint);
}

class ShopDataSourceImpl extends ShopDataSource {
  @override
  Future<dynamic> getShopList(String endpoint) async {
    try {
      final response = await ApiClient().getmethod(endpoint);
      if(response.statusCode==200){
        var result =json.decode(response.body);
        return ShopModel.fromJson(result);
      }else{
        print('e.......${response.statusCode}');
      }
    } catch (e) {
      print('e.......$e');
    }
  }

}