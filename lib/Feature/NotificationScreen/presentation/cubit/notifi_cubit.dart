import 'package:bloc_code/Feature/NotificationScreen/domain/useCases/notifi_usecase.dart';
import 'package:bloc_code/Feature/NotificationScreen/presentation/cubit/notifi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotifiCubit extends Cubit<NotifiState> {
  final NotifiUsecase notifiUsecase;
  NotifiCubit({required this.notifiUsecase}) : super(NotifiInitState());

  Future<void>getNotifiData(String endpoint)async {

    try {
      emit(NotifiLoadingState());
      var response = await notifiUsecase.getNotifiData(endpoint);
      response.fold((failure){
        emit(NotifiErrorState(message: failure.message));
      },(data){
        emit(NotifiSucessState(notifiEntity: data));
      });
    } catch (e) {
      emit(NotifiErrorState(message: e.toString()));
    }
  }
}