// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/bloc_builder/bloc/counterbloc.dart';

class BlocBuilderHome extends StatelessWidget {
  // const BlocBuilderHome({super.key});
  Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
      ),
      body: Center(
        child: Column(
          children: [
            BlocListener<Counter, int>(
              listener: (context, state) {
                // TODO: implement listener
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('nomor 10'),
                  duration: Duration(microseconds: 500),
                ));
              },
              listenWhen: (previous, current) {
                if (current == 10) {
                  return true;
                } else {
                  return false;
                }
              },
              child: BlocBuilder<Counter, int>(
                  bloc: counter,
                  builder: (context, state) {
                    return Text(
                      '$state',
                      style: TextStyle(fontSize: 50, color: Colors.black),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: (() {
                      counter.kurangData();
                    }),
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: (() {
                      counter.tambahData();
                    }),
                    icon: Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
