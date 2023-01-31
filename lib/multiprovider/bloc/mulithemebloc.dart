import 'package:bloc/bloc.dart';

class MultiThemeBloc extends Cubit<bool> {
  MultiThemeBloc() : super(false);

  void changeTheme() {
    emit(!state);
  }
}
