import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(todos: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
        ])) {
    on<SetConfirmFilterEvent>(
        (event, emit) => emit(state.copyWith(filter: GuestFilter.confirmed)));

    on<SetUnConfirmFilterEvent>(
        (event, emit) => emit(state.copyWith(filter: GuestFilter.unconfirmed)));

    on<SetAllFilerEvent>(
        (event, emit) => emit(state.copyWith(filter: GuestFilter.all)));

    on<SetCustomFilterEvent>(
        (event, emit) => emit(state.copyWith(filter: event.newFilter)));
    on<AddNewGuestEvent>((event, emit) =>
        emit(state.copyWith(todos: [...state.todos, event.guest])));

    on<ToggleGuestEvent>(_handlerToggleGuestEvent);
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

  void addNewGuest(Todo newGuest) => add(AddNewGuestEvent(newGuest));

  void setToggle(String id) => add(ToggleGuestEvent(id));

  void _handlerToggleGuestEvent(
      ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final newGuests = state.todos.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
            completedAt: guest.completedAt == null ? DateTime.now() : null);
      }
      return guest;
    }).toList();
    emit(state.copyWith(todos: newGuests));
  }
}
