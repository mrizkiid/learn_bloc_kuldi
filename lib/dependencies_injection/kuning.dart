import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/bloc/counter_bloc.dart';

class Kuning extends StatelessWidget {
  const Kuning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      color: Colors.yellow,
      child: Container(
        margin: EdgeInsets.all(20),
        color: Colors.blue,
        child: Center(
          child: BlocBuilder<CounterBloc, int>(
            bloc: context.read<CounterBloc>(),
            builder: (context, state) {
              return Text(
                '$state',
                style: TextStyle(fontSize: 30, color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
