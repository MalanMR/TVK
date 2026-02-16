import 'package:bloc_code/Feature/ScavengerScreen/domain/entities/scavenger_entity.dart';
import 'package:bloc_code/Feature/ScavengerScreen/domain/repository/scavenger_repository.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class ScavengerUseCase {
  final ScavengerRepository scavengerRepository;
  ScavengerUseCase({required this.scavengerRepository});

  Future<Either<Failure,ScavengerEntity>> getScavengerTask(String endpoint) {
   return scavengerRepository.getScavengerTask(endpoint);
  }
}