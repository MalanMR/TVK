import 'package:bloc_code/Feature/ScavengerScreen/domain/entities/scavenger_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ScavengerState extends Equatable{
  const ScavengerState();

  @override
  List<Object> get props =>[];
}

class ScavengerInitState extends ScavengerState{
  @override
  List<Object> get props => [];
}
class ScavengerLoadingState extends ScavengerState{
  @override
  List<Object> get props => [];
}

class ScavengerErrorState extends ScavengerState{
  final String message ;
  const ScavengerErrorState({required this.message});

}

class ScavengerSucessState extends ScavengerState{
  final ScavengerEntity scavengerEntity ;
  const ScavengerSucessState({required this.scavengerEntity});
}