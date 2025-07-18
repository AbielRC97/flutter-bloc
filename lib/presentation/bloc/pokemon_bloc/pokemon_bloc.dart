import 'package:blocs_app/config/config.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
    on<PokemonAdded>(_handlerPokemonAdded);
  }

  void _handlerPokemonAdded(PokemonAdded event, Emitter<PokemonState> emit) {
    final newPokemons = Map<int, String>.from(state.pokemons);
    newPokemons[event.id] = event.name;
    emit(state.copyWith(pokemons: newPokemons));
  }

  Future<String> fetchPokemonName(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }
    try {
      final name = await PokemonInformation.getPokemonName(id);
      add(PokemonAdded(id, name));
      return name;
    } catch (e) {
      throw Exception("Failed to fetch pokemon name");
    }
  }
}
