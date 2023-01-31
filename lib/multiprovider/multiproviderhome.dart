// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_kuldi/multiprovider/bloc/mulithemebloc.dart';
import 'package:learn_bloc_kuldi/multiprovider/bloc/multicounterbloc.dart';

class MultiProviderHome extends StatelessWidget {
  MultiProviderHome({super.key});

  // final themeBloc = context.read<MultiThemeBloc>();

  @override
  Widget build(BuildContext context) {
    // final themeBloc = context.read<MultiThemeBloc>();
    final themeBloc = context.read<MultiThemeBloc>();
    final counterBloc = context.read<MultiCounterBloc>();
    // final themeBloc = BlocProvider.of<MultiThemeBloc>(context);
    // final counterBloc = BlocProvider.of<MultiCounterBloc>(context);
    return Scaffold(
      floatingActionButton: BlocListener<MultiThemeBloc, bool>(
        listener: (context, state) {
          // TODO: implement listener
          if (state)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Cerah'),
              duration: Duration(milliseconds: 500),
            ));
          else
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Gelap'),
              duration: Duration(milliseconds: 500),
            ));
        },
        child: BlocBuilder<MultiThemeBloc, bool>(
          bloc: themeBloc,
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                themeBloc.changeTheme();
              },
              backgroundColor: state ? Colors.black : Colors.white,
            );
          },
        ),
      ),
      appBar: AppBar(
        title: const Text('Multi Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<MultiCounterBloc, int>(
              listener: (context, state) {
                // TODO: implement listener
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(SnackBar(content: Text('Di Tambahkan')));
                // if (MultiCounterBloc.) {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //       content: Text('Di Tambahkan'),
                //       duration: Duration(milliseconds: 500)));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //       content: Text('Di Kurangi'),
                //       duration: Duration(milliseconds: 500)));
                // }
              },
              // listenWhen: (previous, current) {
              //   if (previous < current) {
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         content: Text('Di Tambahkan'),
              //         duration: Duration(milliseconds: 500)));
              //     // return true;
              //   } else
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         content: Text('Di Kurangi'),
              //         duration: Duration(milliseconds: 500)));
              //   // return false;
              //   return true;
              // },
              child: BlocBuilder<MultiCounterBloc, int>(
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: TextStyle(fontSize: 50),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      counterBloc.kurangData();
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      counterBloc.tambahData();
                    },
                    icon: Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
