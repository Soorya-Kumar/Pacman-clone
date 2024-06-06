
import 'package:flutter/material.dart';

class MyGhost1 extends StatelessWidget {

  const MyGhost1({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Image.asset('assets/images/ghost1.png'),
    );
  }
}