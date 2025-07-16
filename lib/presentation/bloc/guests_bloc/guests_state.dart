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

  int get hoyManyGuests => filterGuests.length;

  List<Todo> get filterGuests {
    switch (filter) {
      case GuestFilter.all:
        return todos;
      case GuestFilter.confirmed:
        return todos.where((todo) => todo.done).toList();
      case GuestFilter.unconfirmed:
        return todos.where((todo) => !todo.done).toList();
    }
  }

  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? todos,
  }) =>
      GuestsState(filter: filter ?? this.filter, todos: todos ?? this.todos);

  @override
  List<Object> get props => [filter, todos];
}
