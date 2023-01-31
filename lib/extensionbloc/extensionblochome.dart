// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/blocselector/bloc/userbloc.dart';

class ExtensionHome extends StatelessWidget {
  const ExtensionHome({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Selctor Home'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                print('nama');
                final watchBloc = context.watch<UserBloc>();
                return Text(
                  'nama : ${watchBloc.state["nama"]}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            Builder(
              builder: (context) {
                print('age');
                final watchBloc = context.watch<UserBloc>();
                return Text(
                  'age : ${watchBloc.state["age"]}',
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
