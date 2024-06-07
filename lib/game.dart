import 'dart:async';
import 'dart:math';

import 'package:Pacman_GO/characters/ghost1.dart';
import 'package:Pacman_GO/characters/ghost2.dart';
import 'package:Pacman_GO/characters/ghost3.dart';
import 'package:Pacman_GO/characters/ghost4.dart';
import 'package:Pacman_GO/characters/pacman.dart';
import 'package:Pacman_GO/movement/ghost_motion.dart';
import 'package:Pacman_GO/map/pixel.dart';
import 'package:Pacman_GO/map/wall.dart';
import 'package:Pacman_GO/movement/player_motion.dart';
import 'package:Pacman_GO/widgets/alert_widget.dart';
import 'package:Pacman_GO/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() {
    return _GameScreen();
  }
}

class _GameScreen extends State<GameScreen> {

//total squares= 364
//total rows(no of items in a column) =  26
//total columns (items in row)= 14

  List<int> barriers = walls;

  List<int> food = [];

  String playerLast = "right";
  String ghostLast1 = "left";
  String ghostLast2 = "left";
  String ghostLast3 = "left";
  String ghostLast4 = "down";

  int score = 0;
  int highscore = 0;

  int player = 175;
  int ghost1 = 17;
  int ghost2 = 15;
  int ghost3 = 348;
  int ghost4 = 346;
  int fruit = -1;

  bool isPause = false;
  bool preGame = true;
  bool mouthClosed = false;

  void restart() {
     setState(() {
      player = 175;
      ghost1 = 17;
      ghost2 = 15;
      ghost3 = 348;
      ghost4 = 346;
      fruit = -1;
      isPause = false;
      preGame = false;
      mouthClosed = false;
      playerLast = "right";
      food.clear();
      getFood();
      highscore = score > highscore ? score : highscore;
      score = 0;
      Navigator.pop(context);
    });
  }

  void pauseFunction(){
    setState(() {
      isPause = !isPause;
    });
  }

  void getFood() {
    for (int i = 0; i < 364; i++) {
      if (!walls.contains(i)) {
        food.add(i);
      }
    }
  }  

  void startGame() {
    if (preGame) {
      preGame = false;
      getFood();

      Timer.periodic(const Duration(milliseconds: 10), (timer) {
        if (player == ghost1 ||
            player == ghost2 ||
            player == ghost3 ||
            player == ghost4) {
          setState(() {
            player = -1;
          });

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertBox(score: score, restart: restart, displayText: 'GAME OVER',);
              });
        }

        else if (score == 243) {
          setState(() {
            player = -1;
            score = 0;
          });

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertBox(score: 250, restart: restart,displayText: 'WINNER!!',);
              });
        }


        
      });



      //ghost movement and update
      Timer.periodic(const Duration(milliseconds: 160), (timer) {
        if (!isPause) {
          List<dynamic> ghost1st = moveGhost(ghostLast1, ghost1, 14, walls);
          List<dynamic> ghost2nd = moveGhost(ghostLast2, ghost2, 14, walls);
          List<dynamic> ghost3rd = moveGhost(ghostLast3, ghost3, 14, walls);
          List<dynamic> ghost4th = moveGhost(ghostLast4, ghost4, 14, walls);

          setState(() {
            ghostLast1 = ghost1st[0].toString();
            ghost1 = ghost1st[1] as int;
            ghostLast2 = ghost2nd[0].toString();
            ghost2 = ghost2nd[1] as int;
            ghostLast3 = ghost3rd[0].toString();
            ghost3 = ghost3rd[1] as int;
            ghostLast4 = ghost4th[0].toString();
            ghost4 = ghost4th[1] as int;
          });
        }
      });




    //player movement and update
      Timer.periodic(const Duration(milliseconds: 140), (timer) {

          if(isPause){
            setState(() {
              mouthClosed = false;
            });
          }
          
          if (!isPause) {
            setState(() {
              mouthClosed = !mouthClosed;
            });
          }          
          
          if (food.contains(player)) {
            setState(() {
              food.remove(player);
            });
            score++;
          }

          if(player == fruit){
          setState(() {
            score += 10;
            fruit = -1;
          });
          }

        setState(() {
          player = movePlayer(player, playerLast, isPause);
        });

      },);

      Timer.periodic(const Duration(milliseconds: 7000), (timer) {
        
        fruit = Random().nextInt(364);
        while(walls.contains(fruit)){
          fruit = Random().nextInt(364);
        }     
      
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(

              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0 && isPause == false) {
                  playerLast = "down";
                } else if (details.delta.dy < 0 && isPause == false) {
                  playerLast = "up";
                }
              },
              
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0 && isPause == false) {
                  playerLast = "right";
                } else if (details.delta.dx < 0 && isPause == false) {
                  playerLast = "left";
                }
              },

                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 14),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 364,

                  itemBuilder: (context, index) {
                    
                    if (mouthClosed && player == index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    } 
                    
                    else if (player == index) {
                      switch (playerLast) {
                          case "left":
                              return Transform.rotate(
                                  angle: pi,
                                  child: const Pacman(),
                              );

                          case "right":
                              return const Pacman();

                          case "up":
                              return Transform.rotate(
                                  angle: 3 * pi / 2,
                                  child: const Pacman(),
                              );

                          case "down":
                              return Transform.rotate(
                                  angle: pi / 2,
                                  child: const Pacman(),
                              );

                          default:
                              return const Pacman();
                      }
                    }
                    
                    else if (ghost1 == index) {
                      return const MyGhost1();
                    }
                    
                    else if (ghost2 == index) {
                      return const MyGhost2();
                    } 
                    
                    else if (ghost3 == index) {
                      return const MyGhost1();
                    } 

                    else if (ghost4 == index) {
                      return const MyGhost4();
                    }

                    else if (fruit == index) {
                      return const MyGhost3();
                    }
                    
                    else if (barriers.contains(index)) {
                      const Color wallColor = Color.fromARGB(255, 121, 122, 122);
                      return MyWall(
                        innerColor: wallColor,
                        outerColor: wallColor,
                        //child: Text(index.toString(),style: const TextStyle(color: Colors.white),),
                      );
                    } 
                    
                    else if (preGame || food.contains(index)) {
                     return MyWall(
                        innerColor: const Color.fromARGB(255, 172, 79, 233),
                        outerColor: const Color.fromARGB(255, 6, 6, 6),
                      );
                    } 
                    
                    else {
                      return MyWall(
                        innerColor: Colors.black,
                        outerColor: Colors.black,
                      );
                    }


                  },
                ),
              ),
            ),
          

                  
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
              child: BottomBar(
                  score: score,
                  highScore: highscore,
                  reset: pauseFunction,
                isPause: isPause,
                pregame: preGame,
                startGame: startGame),
          ),

        ],
      ),
    );
  }
}