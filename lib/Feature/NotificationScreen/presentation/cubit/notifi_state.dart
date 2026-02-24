import 'package:bloc_code/Feature/NotificationScreen/domain/entities/notifi_entity.dart';
import 'package:equatable/equatable.dart';

abstract class NotifiState extends Equatable{
  const NotifiState();

  @override
  List<Object> get props =>[];
}
class NotifiInitState extends NotifiState{
  @override
  List<Object> get props =>[];
}
class NotifiLoadingState extends NotifiState{
  @override
  List<Object> get props => [];
}

class NotifiErrorState extends NotifiState{
  final String message ;
  const NotifiErrorState({required this.message});

}

class NotifiSucessState extends NotifiState{
  final NotifiEntity notifiEntity ;
  const NotifiSucessState({required this.notifiEntity});
}