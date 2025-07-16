part of 'guests_bloc.dart';

enum GuestFilter {
  all,
  confirmed,
  unconfirmed,
}

class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> todos;

  const GuestsState({this.filter = GuestFilter.all, this.todos = const []});

  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? todos,
  }) =>
      GuestsState(filter: filter ?? this.filter, todos: todos ?? this.todos);

  @override
  List<Object> get props => [filter, todos];
}
