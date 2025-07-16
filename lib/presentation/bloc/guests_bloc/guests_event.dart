part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

final class SetAllFilerEvent extends GuestsEvent {}

final class SetConfirmFilterEvent extends GuestsEvent {}

final class SetUnConfirmFilterEvent extends GuestsEvent {}

final class SetCustomFilterEvent extends GuestsEvent {
  final GuestFilter newFilter;
  const SetCustomFilterEvent(this.newFilter);
}
