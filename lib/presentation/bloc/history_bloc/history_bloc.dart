import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState()) {
    on<NewLocation>(_handlerNewLocation);
  }

  void _handlerNewLocation(NewLocation event, Emitter<HistoryState> emit) {
    emit(state.copyWith(locations: [...state.locations, event.location]));
  }

  void onNewLocation((double lat, double lng) location) =>
      add(NewLocation(location));
}
