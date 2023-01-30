import 'package:bloc/bloc.dart';

class BlocProviderBloc extends Cubit<int> {
  BlocProviderBloc({this.initialState = 0}) : super(initialState);
  final initialState;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}
