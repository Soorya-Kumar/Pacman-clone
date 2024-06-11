import 'package:Pacman_GO/map/wall.dart';

int moveLeft(int player) {
  if (!walls.contains(player - 1)) {
    return --player;
  }
  return player;
}

int moveRight(int player) {
  if (!walls.contains(player + 1)) {
    return ++player;
  }
  return player;
}

int moveUp(int player) {
  if (!walls.contains(player - 14)) {
    return (player - 14);
  }
  return player;
}

int moveDown(int player) {
  if (!walls.contains(player + 14)) {
    return (player + 14);
  }
  return player;
}


int movePlayer(int player, String playerLast, bool isPause) {


  int flag = 0;

  if(isPause) return player;
  
  if (player == 168 && playerLast == "left") {
    flag = 1;
    player = 181;
  }

  if (player == 181 && playerLast == "right") {
    flag = 1;
    player = 168;
  }

  if (player == 182 && playerLast == "left") {
    flag = 1;
    player = 195;
  }

  if (player == 195 && playerLast == "right") {
    flag = 1;
    player = 182;
  }

  if (player == 6 && playerLast == "up") {
    flag = 1;
    player = 356;
  }

  if (player == 7 && playerLast == "up") {
    flag = 1;
    player = 357;
  }

  if (player == 356 && playerLast == "down") {
    flag = 1;
    player = 6;
  }

  if (player == 357 && playerLast == "down") {
    flag = 1;
    player = 7;  
  }

  if (flag == 0) {
    switch (playerLast) {
      case "left":
        player = moveLeft(player);
        break;
      case "right":
        player = moveRight(player);
        break;
      case "up":
        player = moveUp(player);
        break;
      case "down":
        player = moveDown(player);
        break;
    }
  }


  return player;
}
