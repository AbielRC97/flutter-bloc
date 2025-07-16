import 'package:bloc/bloc.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState()) {
    on<SetConfirmFilterEvent>(
        (event, emit) => emit(state.copyWith(filter: GuestFilter.confirmed)));

    on<SetUnConfirmFilterEvent>(
        (event, emit) => emit(state.copyWith(filter: GuestFilter.unconfirmed)));

    on<SetAllFilerEvent>(
        (event, emit) => emit(state.copyWith(filter: GuestFilter.all)));

    on<SetCustomFilterEvent>(
        (event, emit) => emit(state.copyWith(filter: event.newFilter)));
  }

  void changeFilter({required GuestFilter newFilter}) {
    switch (newFilter) {
      case GuestFilter.all:
        add(SetAllFilerEvent());
        break;
      case GuestFilter.confirmed:
        add(SetConfirmFilterEvent());
        break;
      case GuestFilter.unconfirmed:
        add(SetUnConfirmFilterEvent());
        break;
    }
  }

  void changeCustomFilter({required GuestFilter newFilter}) =>
      add(SetCustomFilterEvent(newFilter));
}
