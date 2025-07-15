import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super('no-username');

  void setUsername({required String username}) {
    if (username.isEmpty) return;
    emit(username);
  }
}
