// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/blocselector/bloc/userbloc.dart';

class BlocSelectorHome extends StatelessWidget {
  const BlocSelectorHome({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Selctor Home'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            BlocSelector<UserBloc, Map<String, dynamic>, String>(
              selector: (state) {
                return state['nama'];
              },
              builder: (context, state) {
                print('nama');
                return Text(
                  'nama : $state',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            BlocSelector<UserBloc, Map<String, dynamic>, int>(
              selector: (state) {
                return state['age'];
              },
              builder: (context, state) {
                print('age');
                return Text(
                  'age : $state',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      userBloc.changeAge(userBloc.state['age'] - 1);
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      userBloc.changeAge(userBloc.state['age'] + 1);
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
            TextField(
              onChanged: (value) => userBloc.changeName(value),
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
