import 'package:bloc_code/Feature/NotificationScreen/data/dataSource/notifi_data_source.dart';
import 'package:bloc_code/Feature/NotificationScreen/domain/entities/notifi_entity.dart';
import 'package:bloc_code/Feature/NotificationScreen/domain/repository/notifi_repository.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class NotifiRepoImpl extends NotifiRepository {
  final NotifiDataSource notifiDataSource;

  NotifiRepoImpl({required this.notifiDataSource});

  @override
  Future<Either<Failure, NotifiEntity>> getNotifiData(String endpoint) async {
    try {
      final response = await notifiDataSource.getnotifiData(endpoint);
      if(response is NotifiEntity){
        return Right(response);
      }
      else{
        return Left(Failure(message: response));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}