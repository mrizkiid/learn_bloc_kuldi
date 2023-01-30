// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/404.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/bloc/counter_bloc.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/depedencies_home.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/other_page.dart';

class RoutesClass {
  final counter = CounterBloc();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: DepedenciesHome(),
          ),
        );
      case 'other':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: OrtherPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => ErrorPage404(),
        );
    }
  }
}
