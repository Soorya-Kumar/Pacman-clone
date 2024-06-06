import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AlertBox extends StatelessWidget {
 
  const AlertBox(
      {super.key,
      required this.score,
      required this.restart,
      required this.displayText});

 
  final int score;
  final Function restart;
  final String displayText;
 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
 
      alignment: Alignment.center,
      backgroundColor: const Color.fromARGB(255, 19, 93, 222),
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(1.0),
      scrollable: false,
      titleTextStyle: GoogleFonts.pressStart2p(
        color: const Color.fromARGB(255, 237, 237, 237),
        fontSize: 14,
      ),
 
      title: Center(child: Text(displayText)),
      content: Text('Your Score : ${(score).toString()}'),
 
      actions: [
 
        
        TextButton(
          onPressed: () {
            restart();
          },
          style: ButtonStyle(
            textStyle:
                MaterialStateProperty.all(const TextStyle(color: Colors.white)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(1.0)),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 3, 10, 229),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'RESTART',
              style: GoogleFonts.pressStart2p(
                  color: const Color.fromARGB(255, 237, 237, 237),
                  fontSize: 14),
            ),
          ),
        ),
 
 
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 3, 10, 229),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'HOME',
              style: GoogleFonts.pressStart2p(
                  color: const Color.fromARGB(255, 237, 237, 237),
                  fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}
