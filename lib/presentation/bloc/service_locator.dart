import 'package:blocs_app/config/router/app_router.dart';
import 'package:blocs_app/presentation/bloc/blocs.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void iniatialized() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(AppRouterCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());

  getIt.registerSingleton(HistoryBloc());
  getIt.registerSingleton(GeolocationCubit(
      onNewLocationCallback: getIt<HistoryBloc>().onNewLocation)
    ..watchUserLocation());

  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(PokemonBloc());
}
