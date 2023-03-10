// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/bloc_builder/bloc/counterbloc.dart';
import 'package:learn_bloc_kuldi/bloc_builder/blocbuilderhome.dart';
import 'package:learn_bloc_kuldi/bloc_provider/bloc/blocproveder_bloc.dart';
import 'package:learn_bloc_kuldi/bloc_provider/blocproviderhome.dart';
import 'package:learn_bloc_kuldi/blocselector/bloc/userbloc.dart';
import 'package:learn_bloc_kuldi/blocselector/blocselectorhome.dart';
import 'package:learn_bloc_kuldi/cubit_pertama/cubit_pertama_home.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/bloc/counter_bloc.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/depedencies_home.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/routes.dart';
import 'package:learn_bloc_kuldi/multiprovider/bloc/mulithemebloc.dart';
import 'package:learn_bloc_kuldi/multiprovider/bloc/multicounterbloc.dart';
import 'package:learn_bloc_kuldi/multiprovider/multiproviderhome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final route = RoutesClass();
    // return MaterialApp(
    //   home: BlocProvider(
    //     create: (context) => route.counter,),
    // );

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MultiCounterBloc(),
        ),
        BlocProvider(
          create: (context) => MultiThemeBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        )
      ],
      // child: MyAppSecond(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<MultiThemeBloc, bool>(
              bloc: context.read<MultiThemeBloc>(),
              builder: (context, state) {
                return MaterialApp(
                  theme: state ? ThemeData.light() : ThemeData.dark(),
                  home: BlocSelectorHome(),
                );
              });
        },
      ),
    );
  }
}

class MyAppSecond extends StatelessWidget {
  MyAppSecond({super.key});
  // MultiThemeBloc themeBloc = MultiThemeBloc();
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //         create: (context) => MultiCounterBloc(),
    //       ),
    //       BlocProvider(
    //         create: (context) => themeBloc,
    //       ),
    //     ],
    //     child: BlocBuilder<MultiThemeBloc, bool>(
    //       bloc: themeBloc,
    //       builder: (context, state) {
    //         return MaterialApp(
    //           theme: state ? ThemeData.light() : ThemeData.dark(),
    //           home: BlocProvider(
    //             create: (context) => MultiThemeBloc(),
    //             child: MultiProviderHome(),
    //           ),
    //         );
    //       },
    //     ));
    return BlocBuilder<MultiThemeBloc, bool>(
        bloc: context.read<MultiThemeBloc>(),
        builder: (context, state) {
          return MaterialApp(
            theme: state ? ThemeData.light() : ThemeData.dark(),
            home: MultiProviderHome(),
          );
        });
  }
}
