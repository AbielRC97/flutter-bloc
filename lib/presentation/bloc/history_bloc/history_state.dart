part of 'history_bloc.dart';

class HistoryState extends Equatable {
  final List<(double lat, double lng)> locations;
  int get howMany => locations.length;

  const HistoryState({this.locations = const []});

  HistoryState copyWith({
    List<(double lat, double lng)>? locations,
  }) =>
      HistoryState(locations: locations ?? this.locations);
  @override
  List<Object> get props => [locations];
}
