import 'package:bloc_code/Feature/ScavengerScreen/domain/useCases/scavenger_use_case.dart';
import 'package:bloc_code/Feature/ScavengerScreen/presentation/cubit/scavenger_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScavengerCubit extends Cubit<ScavengerState> {
  final ScavengerUseCase scavengerUseCase;

  ScavengerCubit({required this.scavengerUseCase}):super(ScavengerInitState());

  Future<void>getScavengerTask(String endpoint)async {

    try {
      emit(ScavengerLoadingState());
      var response = await scavengerUseCase.getScavengerTask(endpoint);
      response.fold((failure){
        emit(ScavengerErrorState(message: failure.message));
      },(data){
        emit(ScavengerSucessState(scavengerEntity: data));
      });
    } catch (e) {
      emit(ScavengerErrorState(message: e.toString()));
    }
  }
}