import 'package:flutter/material.dart';
import 'package:learn_bloc_kuldi/dependencies_injection/kuning.dart';

class Merah extends StatelessWidget {
  const Merah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.red,
      // margin: EdgeInsets.all(20),
      child: Kuning(),
    );
  }
}
