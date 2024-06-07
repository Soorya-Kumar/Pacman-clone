import 'dart:math';
import 'package:Pacman_GO/map/wall.dart';

List<int> easyGhostMotion(int ghostPosition, int lastGhostPosition) {
  List<int> possibleMoves = [];

  // Calculate potential new positions
  int up = (ghostPosition > 13) ? ghostPosition - 14 : ghostPosition + 350;
  int down = (ghostPosition < 350) ? ghostPosition + 14 : ghostPosition - 350;
  int left = (ghostPosition % 14 != 0) ? ghostPosition - 1 : ghostPosition + 13;
  int right = (ghostPosition % 14 != 13) ? ghostPosition + 1 : ghostPosition - 13;

  // Add valid moves to the list
  if (!walls.contains(up)) possibleMoves.add(up);
  if (!walls.contains(down)) possibleMoves.add(down);
  if (!walls.contains(left)) possibleMoves.add(left);
  if (!walls.contains(right)) possibleMoves.add(right);

  // Remove the last position to avoid moving back immediately
  possibleMoves.remove(lastGhostPosition);

  // If no valid moves are available, stay in the same position
  if (possibleMoves.isEmpty) {
    return [ghostPosition, lastGhostPosition];
  }

  // Randomly select a valid move
  Random random = Random();
  int randomIndex = random.nextInt(possibleMoves.length);

  return [ghostPosition,possibleMoves[randomIndex]];
}
