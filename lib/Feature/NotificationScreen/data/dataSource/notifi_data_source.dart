import 'dart:convert';
import 'package:bloc_code/Feature/NotificationScreen/data/models/notifi_model.dart';
import 'package:bloc_code/core/network/api_client.dart';

abstract class NotifiDataSource {
  Future<dynamic> getnotifiData(String endpoint);
}
class NotifiDataSourceImpl extends NotifiDataSource {
  @override
  Future<dynamic> getnotifiData(String endpoint) async{
    try {
      final response = await ApiClient().getmethod(endpoint);
      if(response.statusCode==200){
        var result =json.decode(response.body);
        return NotifiModel.fromJson(result);
      }else{
        print('e.......${response.statusCode}');
      }
    } catch (e) {
      print('e.......$e');
    }
  }
}

