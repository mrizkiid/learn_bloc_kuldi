// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/bloc/counter_bloc.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/merah.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/other_page.dart';

class DepedenciesHome extends StatelessWidget {
  const DepedenciesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: context.read<CounterBloc>(),
              child: OrtherPage(),
            ),
          ));
        },
      ),
      appBar: AppBar(
        title: Text('Depedencies Injection'),
        centerTitle: true,
        backgroundColor: Colors.amber.shade800,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Material(
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  context.read<CounterBloc>().kurangData();
                },
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: Icon(Icons.remove),
                ),
              ),
            ),
            Merah(),
            Material(
              color: Colors.yellow,
              child: InkWell(
                onTap: () {
                  context.read<CounterBloc>().tambahData();
                },
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
