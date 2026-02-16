import 'package:bloc_code/Feature/ScavengerScreen/data/dataSource/scavenger_data_source.dart';
import 'package:bloc_code/Feature/ScavengerScreen/domain/entities/scavenger_entity.dart';
import 'package:bloc_code/Feature/ScavengerScreen/domain/repository/scavenger_repository.dart';
import 'package:bloc_code/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class ScavengerRepoImpl extends ScavengerRepository {

  final ScavengerDataSource scavengerDataSource;
  ScavengerRepoImpl({required this.scavengerDataSource});

  @override
  Future<Either<Failure, ScavengerEntity>> getScavengerTask(String endpoint) async {

    try {
      final response = await scavengerDataSource.getScavengerTask(endpoint);
      if(response is ScavengerEntity){
            return Right(response);
          }
      else{
            return Left(Failure(message: response));
          }
    } catch (e) {
      //print(e);
      return Left(Failure(message: e.toString()));
    }
  
  }

}