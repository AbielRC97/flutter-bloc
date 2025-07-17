import 'package:blocs_app/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyBloc = context.watch<HistoryBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones: ${historyBloc.state.howMany}'),
      ),
      body: ListView.builder(
          itemCount: historyBloc.state.howMany,
          itemBuilder: (context, index) {
            final (lat, lng) = historyBloc.state.locations[index];
            return ListTile(
              title: Text('Lat: $lat, Lng: $lng'),
            );
          }),
    );
  }
}
