import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/entities/todo.dart';
import 'package:blocs_app/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<GuestsBloc>().addNewGuest(Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null));
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    final guestsbloc = context.watch<GuestsBloc>();
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: GuestFilter.all, icon: Text('Todos')),
            ButtonSegment(
                value: GuestFilter.confirmed, icon: Text('Invitados')),
            ButtonSegment(
                value: GuestFilter.unconfirmed, icon: Text('No invitados')),
          ],
          selected: <GuestFilter>{guestsbloc.state.filter},
          onSelectionChanged: (value) {
            guestsbloc.changeCustomFilter(newFilter: value.first);
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: guestsbloc.state.hoyManyGuests,
            itemBuilder: (context, index) {
              final guest = guestsbloc.state.filterGuests[index];
              return SwitchListTile(
                  title: Text(guest.description),
                  value: guest.done,
                  onChanged: (value) {
                    guestsbloc.setToggle(guest.id);
                  });
            },
          ),
        )
      ],
    );
  }
}
