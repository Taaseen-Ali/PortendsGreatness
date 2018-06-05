import java.util.*;

Board board = new Board();
int level;

void setup() {
  size(400, 500);      
  board.setup();
}

void mouseClicked(){
  board.mouseClick();
}

void draw() {
  background(209);
  board.draw();
}
