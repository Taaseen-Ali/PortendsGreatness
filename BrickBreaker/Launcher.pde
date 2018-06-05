import java.util.LinkedList;
public class Launcher {
  LinkedList<Ball> balls;
  Board board;
  int lastX;
  int chamberedBall = 0;
  boolean allDone = true;;
  boolean unchamber = false;

  Launcher(Board b) {
    lastX = 200;
    balls = new LinkedList<Ball>();
    allDone = true;
    board = b;
  }

  void draw() {
    // determines if all balls are done without affecting actual allDone
    boolean tempAllDone = true;
    
    if (unchamber) unchamber();
    
    // draws each ball and determines state
    for (Ball b : balls) {
      b.draw();
      
      if (lastX > -1) {
        b.setStart(lastX);
      }
      // determines first ball to return
      if (!b.moving() && lastX == -1){
        lastX = b.getX();
      }
      
      // if a ball is moving, balls are not done
      else if (b.moving() || !b.ready()) {
        tempAllDone = false;
      }
    }
    
    // set actual boolean equal to temp
    allDone = tempAllDone;
  }

  // ** not implemented yet
  double[] getVectors(int x, int y) {
    double hypotenuse = Math.sqrt(x * x + y * y);
    double scale = (Math.sqrt(2) / hypotenuse);
    double[] vectors = {(double) (x * scale), (double) (y * scale)};
    return vectors;
  }

  void addBall() {
    balls.add(new Ball(lastX, board));
  }

  void fire() {
    // mouse debounce
    if (allDone) {
      allDone = false;
      unchamber = true;
      chamberedBall = 0;
    }
  }

  void unchamber() {
    double[] vectors = getVectors(mouseX, mouseY);
    println(vectors[0], vectors[1]);

    Ball b = balls.get(chamberedBall);
    b.setX(lastX);  
    if (chamberedBall==0) {
      b.setMoving(true);
      b.setXDir(1);
      b.setYDir(1);
      chamberedBall++;
    } 
    else {
      Ball prev = balls.get(chamberedBall-1);
      if (dist(prev.getX(), prev.getY(), b.getX(), b.getY()) >= 15) {
        b.setMoving(true);
        b.setXDir(1);
        b.setYDir(1);
        chamberedBall++;
      }
      if(chamberedBall==balls.size()){
        unchamber = false;
        lastX = -1;
      }
      //b.setDirX(vectors[0]);
      //b.setDirY(vectors[1]);
    }
  }
}
/*
    while(i<balls.size())
 Ball b = balls.get(i);
 b.setX(lastX);
 b.setMoving(true);
 b.setXDir(1);
 b.setYDir(1);
 //b.setDirX(vectors[0]);
 //b.setDirY(vectors[1]);
 }
 */
