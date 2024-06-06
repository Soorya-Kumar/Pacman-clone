
import 'package:flutter/material.dart';

class Pacman extends StatelessWidget {

  const Pacman({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Image.asset('assets/images/pacman.png'),
    );
  }
}