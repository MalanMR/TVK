import 'package:bloc_code/Feature/NotificationScreen/domain/entities/notifi_entity.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NotifiRepository {
  Future<Either<Failure,NotifiEntity>> getNotifiData(String endpoint);
}