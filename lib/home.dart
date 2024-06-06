import 'package:dummy_app/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      
      child: Container(
        
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const SizedBox(height: 130),
            Text(
              'PACMAN',
              style: GoogleFonts.pressStart2p(
                color: const Color.fromARGB(255, 255, 247, 0),
                fontSize: 50,
              ),
            ),
            
            
            const SizedBox(height: 540),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const GameScreen()));
              },
              child: Text(
                ' P L A Y ',
                style: GoogleFonts.pressStart2p(
                  color: const Color.fromARGB(255, 0, 68, 255),
                  fontSize: 20,
                ),
              ),
            ),
            
            
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                const GameScreen();
              },
              child: Text(
                'HOW TO PLAY',
                style: GoogleFonts.pressStart2p(
                  color: const Color.fromARGB(255, 0, 98, 255),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
