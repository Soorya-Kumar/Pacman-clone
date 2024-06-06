// This file contains the logic for the movement of the ghosts in the game.
// The function moveGhost() takes in the last direction of the ghost and the current position of the ghost,
// and returns the new direction and position of the ghost. 
//The function uses a switch statement to determine the new direction of the ghost based on the last direction and the position of the ghost.
// The function also checks for walls and changes the direction of the ghost accordingly.
// This logic is similar to the movement of the player in the game, but is specific to the movement of the ghosts.
// This file is a separate file from the main game logic file, and contains the logic for the movement of the ghosts only.


List<dynamic> moveGhost(String ghostLast, int ghost, int numberInRow, List<int> walls) {


  switch (ghostLast) {
    
    
    case "left":
      
      if (!walls.contains(ghost - 1)) {
        
        ghost--;
      
      } else {
        if (!walls.contains(ghost + numberInRow)) {
      
          ghost += numberInRow;
          ghostLast = "down";
      
        } else if (!walls.contains(ghost + 1)) {
      
          ghost++;
          ghostLast = "right";
      
        } else if (!walls.contains(ghost - numberInRow)) {
      
          ghost -= numberInRow;
          ghostLast = "up";
      
        }
      }
      break;



    case "right":
              if (!walls.contains(ghost + 1)) {
                
                  ghost++;
                
              } else {
                if (!walls.contains(ghost - numberInRow)) {
                 
                    ghost -= numberInRow;
                    ghostLast = "up";
                
                } else if (!walls.contains(ghost + numberInRow)) {
                  
                    ghost += numberInRow;
                    ghostLast = "down";
                 
                } else if (!walls.contains(ghost - 1)) {
                  
                    ghost--;
                    ghostLast = "left";
                 
                }
              }
              break;



    case "up":
              if (!walls.contains(ghost - numberInRow)) {
                
                  ghost -= numberInRow;
                  ghostLast = "up";
                
              } else {
                if (!walls.contains(ghost + 1)) {
                  
                    ghost++;
                    ghostLast = "right";
                  
                } else if (!walls.contains(ghost - 1)) {
                  
                    ghost--;
                    ghostLast = "left";
                  
                } else if (!walls.contains(ghost + numberInRow)) {
                  
                    ghost += numberInRow;
                    ghostLast = "down";
                  
                }
              }
              break;



    case "down":
              if (!walls.contains(ghost + numberInRow)) {
                
                  ghost += numberInRow;
                  ghostLast = "down";
                
              } else {
                if (!walls.contains(ghost - 1)) {
                
                    ghost--;
                    ghostLast = "left";
                
                } else if (!walls.contains(ghost + 1)) {
                
                    ghost++;
                    ghostLast = "right";
                
                } else if (!walls.contains(ghost - numberInRow)) {
                
                    ghost -= numberInRow;
                    ghostLast = "up";
                
                }
              }
              break;

  }

  return [ghostLast, ghost];
}
