import 'package:bloc_code/Feature/NotificationScreen/domain/entities/notifi_entity.dart';
import 'package:bloc_code/Feature/NotificationScreen/domain/repository/notifi_repository.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class NotifiUsecase {
  final NotifiRepository notifiRepository;
  NotifiUsecase({required this.notifiRepository});

  Future<Either<Failure,NotifiEntity>> getNotifiData(String endpoint) {
    return notifiRepository.getNotifiData(endpoint);
  }
}