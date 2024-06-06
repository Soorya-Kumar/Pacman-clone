import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'How to Play',
              style: GoogleFonts.pressStart2p(color: Colors.white),
            ),
            backgroundColor: Colors.blue[900],
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Welcome to our Pac-Man game! \n\n'
                      'MOVING AROUND:\n'
                      'Swipe to move your pacman around the map.. '
                      'Your goal is to eat all the dots in the maze without getting caught by the ghosts.\n\n'
                      'GHOSTS:\n'
                      'There are four ghosts in the maze that will try to catch you. '
                      'Each ghost has a different behavior, so watch out! '
                      'If a ghost catches you, you lose a life. Lose all your lives, and it\'s game over!\n\n'
                      'FRUIT:\n'
                      'Occasionally, a piece of fruit will appear in the map... '
                      'Eating the fruit will give you bonus points. '
                      'The fruit will disappear after a few seconds, so be quick!\n\n'
                      'Good luck, and have fun!',
                      style: GoogleFonts.pressStart2p(
                        color: Colors.white,
                        fontSize: 17,
                        wordSpacing: 2, 
                      ),
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/pacman.gif',
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ],
          )),
    );
  }
}
