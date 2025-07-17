import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/bloc/blocs.dart';

void main() {
  iniatialized();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UsernameCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AppRouterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<CounterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GuestsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<PokemonBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<GeolocationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HistoryBloc>(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<AppRouterCubit>().state;
    final themeApp = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: themeApp.isDarkMode).getTheme(),
    );
  }
}
