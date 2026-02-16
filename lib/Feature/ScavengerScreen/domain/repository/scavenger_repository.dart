import 'package:bloc_code/Feature/ScavengerScreen/domain/entities/scavenger_entity.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ScavengerRepository {
  Future<Either<Failure,ScavengerEntity>> getScavengerTask(String endpoint);
}