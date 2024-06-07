import 'dart:math';

import 'package:Pacman_GO/map/wall.dart';

(int,int) calculate2D(int index){

  int row = index ~/ 14;
  int col = index % 14;

  return (row,col);
}

double calculateDistance((int,int) a, (int,int) b){ 
  return sqrt(pow(a.$1 - b.$1, 2) + pow(a.$2 - b.$2, 2));
}

List<int> hardGhostMotion(int ghostPosition, int playerPosition, int lastGhostPosition) {
  (int,int) pacman = calculate2D(playerPosition); 
  
  List<int> possibleMoves = [];

  int up = (ghostPosition > 13) ? ghostPosition - 14 : ghostPosition + 350;
  int down = (ghostPosition < 350) ? ghostPosition + 14 : ghostPosition - 350;
  int left = (ghostPosition % 14 != 0) ? ghostPosition - 1 : ghostPosition + 13;
  int right = (ghostPosition % 14 != 13) ? ghostPosition + 1 : ghostPosition - 13;

  if (!walls.contains(up)) possibleMoves.add(up);
  if (!walls.contains(down)) possibleMoves.add(down);
  if (!walls.contains(left)) possibleMoves.add(left);
  if (!walls.contains(right)) possibleMoves.add(right);

  possibleMoves.remove(lastGhostPosition);

  if (possibleMoves.isEmpty) {
    return [ghostPosition, lastGhostPosition]; 
  }

  int nextMove = findShortestPath(pacman, possibleMoves);
  return [ghostPosition, possibleMoves[nextMove]];
}

int findShortestPath((int,int) pacman, List<int> possibleMoves) {
  double shortest = double.infinity;
  int index = -1;
  for (int i = 0; i < possibleMoves.length; i++) {
    (int,int) ghost = calculate2D(possibleMoves[i]);
    double dist = calculateDistance(ghost, pacman);
    if (dist < shortest) {
      shortest = dist;
      index = i;
    }
  }
  return index;
}