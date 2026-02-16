import 'dart:convert';
import 'package:bloc_code/Feature/ScavengerScreen/data/models/scavenger_model.dart';
import 'package:bloc_code/core/network/api_client.dart';

abstract class ScavengerDataSource {
  Future<dynamic> getScavengerTask(String endpoint);
}
class ScavengerDataSourceImpl extends ScavengerDataSource{

  @override
  Future<dynamic> getScavengerTask(String endpoint) async {
    try {
      final response = await ApiClient().getmethod(endpoint);
      if(response.statusCode==200){
        var result =json.decode(response.body);
        return ScavengerModel.fromJson(result);
      }else{
        print('e.......${response.statusCode}');
      }
    } catch (e) {
      print('e.......$e');
    }
  }

}