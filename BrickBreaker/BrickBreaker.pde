import java.util.*;

Board board = new Board();
int level; 

// currently the board is set up for 1 cycle of bricks
// NEXT STEP: allow for continuous rounds of play
void setup() {
  size(400, 500);      
  board.setup();
}

// mouseClick works as intended to fire balls
// NEXT STEP: use mouse position to determine vectors of the balls
void mouseClicked(){
  board.mouseClick();
}

// currently draws background and board
// NEXT STEP: extra graphics that aid the user in understanding
void draw() {
  background(209);
  board.draw();
}
