import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({"nama": "s", "age": 0});

  void changeName(String name) {
    emit({"nama": name, "age": state['age']});
  }

  void changeAge(int age) {
    emit({"nama": state['nama'], "age": age});
  }

  @override
  void onChange(Change<Map<String, dynamic>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
