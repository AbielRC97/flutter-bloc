part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class NewLocation extends HistoryEvent {
  final (double lat, double lng) location;
  const NewLocation(this.location);
  @override
  List<Object> get props => [location];
}
