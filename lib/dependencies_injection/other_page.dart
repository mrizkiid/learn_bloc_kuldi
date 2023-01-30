import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/bloc/counter_bloc.dart';

class OrtherPage extends StatelessWidget {
  const OrtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
      ),
      body: Center(
          child: BlocBuilder<CounterBloc, int>(
        bloc: context.read<CounterBloc>(),
        builder: (context, state) {
          return Text(
            '$state',
            style: const TextStyle(fontSize: 50),
          );
        },
      )),
    );
  }
}
