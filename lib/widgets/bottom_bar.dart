import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.score,
    required this.highScore,
    required this.reset,
    required this.isPause,
    required this.pregame,
    required this.startGame,
  });

  final int score;
  final int highScore;
  final Function reset;
  final bool isPause;
  final bool pregame;
  final Function startGame;

  @override
  State<BottomBar> createState() {
    return _BottomBar();
  }
}

class _BottomBar extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        color: const Color.fromARGB(255, 81, 93, 79),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            
            const SizedBox(
              width: 8,
            ),
            
            
            
            
            Text(
              'HIGH SCORE : ',
              style: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 5, 247, 118),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              widget.highScore.toString(),
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            
            
            
            
            if (widget.pregame)
              const SizedBox(
                width: 40,
              ),
            if (widget.pregame)
              GestureDetector(
                onTap: widget.startGame as void Function()?,
                child: Text(
                  "P L A Y ",
                  style: GoogleFonts.pressStart2p(
                      color: Colors.white, fontSize: 18),
                ),
              ),
            
            
            
            const SizedBox(
              width: 30,
            ),
            
            
            
            if (!widget.pregame)
              Text(
                'SCORE : ',
                style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 5, 247, 118),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            if (!widget.pregame)
              const SizedBox(
                width: 4,
              ),
            if (!widget.pregame)
              Text(
                widget.score.toString(),
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            
            
            
            if (!widget.pregame)
              const SizedBox(
                width: 20,
              ),
           
                      
           
            if (widget.isPause && !widget.pregame)
              GestureDetector(
                onTap: widget.reset as void Function()?,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.play_circle_outline,
                    color: Color.fromARGB(255, 5, 255, 9),
                    size: 40,
                  ),
                ),
              ),
            
            
            if (!widget.isPause && !widget.pregame)
              GestureDetector(
                onTap: widget.reset as void Function()?,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.pause_circle_outline,
                    color: Color.fromARGB(255, 5, 255, 9),
                    size: 40,
                  ),
                ),
              ),
          
          
          
          ],
        ),
      ),
    );
  }
}
