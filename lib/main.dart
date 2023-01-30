// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/bloc_builder/bloc/counterbloc.dart';
import 'package:learn_bloc_kuldi/bloc_builder/blocbuilderhome.dart';
import 'package:learn_bloc_kuldi/bloc_provider/bloc/blocproveder_bloc.dart';
import 'package:learn_bloc_kuldi/bloc_provider/blocproviderhome.dart';
import 'package:learn_bloc_kuldi/cubit_pertama/cubit_pertama_home.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/bloc/counter_bloc.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/depedencies_home.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final route = RoutesClass();
    return MaterialApp(
      home: BlocProvider(
        create: (context) => route.counter,),
    );
    // MaterialApp(
    //   home: BlocProvider(
    //     create: (context) => CounterBloc(),
    //     child: DepedenciesHome(),
    //   ),
    // );
    // BlocProvider(
    //   create: (context) => CounterBloc(),
    //   child: MaterialApp(
    //     home: DepedenciesHome(),
    //   ),
    // );
  }
}
