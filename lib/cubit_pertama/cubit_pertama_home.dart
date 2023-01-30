// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitPertamaHome extends StatelessWidget {
  // const CubitPertamaHome({super.key});

  CounterCubit cCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Cubit Pertama'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: cCubit.stream,
            initialData: cCubit.initialdata,
            builder: (context, snapshot) {
              // if (snapshot.conn) {
              return Text(
                '${snapshot.data}',
                style: TextStyle(fontSize: 50, color: Colors.black),
              );
              // } else {
              //   return CircularProgressIndicator();
              // }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: (() {
                    cCubit.kurangData();
                  }),
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: (() {
                    cCubit.tambahData();
                  }),
                  icon: Icon(Icons.add))
            ],
          )
        ],
      )),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialdata = 0}) : super(initialdata);

  int initialdata;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
