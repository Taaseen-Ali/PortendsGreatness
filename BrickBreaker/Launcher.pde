import java.util.LinkedList;
public class Launcher {
  LinkedList<Ball> balls;
  Board board;
  int nextStart, chamberedBall;
  boolean allDone, unchamber;

  Launcher(Board b) {
    balls = new LinkedList<Ball>();
    board = b;
    nextStart = 200;
    chamberedBall = 0;
    allDone = true;
    unchamber = false;
  }

  void draw() {
    // determines if all balls are done without affecting actual allDone
    boolean tempAllDone = true;
    
    // unchambers balls if they are chambered
    if (unchamber) unchamber();
    
    // draws each ball and determines state
    for (Ball b : balls) {
      b.draw();
      
      // if nextStartPosition is found, set each balls start position
      if (nextStart > -1) {
        b.setStart(nextStart);
      }
      // determines first ball to return
      if (!b.moving() && nextStart == -1){
        nextStart = b.getX();
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
  // NEXT STEP: generate vectors based off of (200,500) 
  double[] getVectors(int x, int y) {
    double hypotenuse = Math.sqrt(x * x + y * y);
    double scale = (Math.sqrt(2) / hypotenuse);
    double[] vectors = {(double) (x * scale), (double) (y * scale)};
    return vectors;
  }

  void addBall() {
    balls.add(new Ball(nextStart, board));
  }

  // fires balls if not fired
  void fire() {
    // mouse debounce
    if (allDone) {
      allDone = false;
      unchamber = true;
      chamberedBall = 0;
    }
  }

  // unloads each ball one at a time
  void unchamber() {
    double[] vectors = getVectors(mouseX, mouseY);
    println(vectors[0], vectors[1]);

    Ball b = balls.get(chamberedBall);
    b.setX(nextStart);  
    if (chamberedBall==0) {
      b.setMoving(true);
      // NEXT STEP: utilize getVectors
      b.setXDir(1);
      b.setYDir(1);
      chamberedBall++;
    } 
    else {
      Ball prev = balls.get(chamberedBall-1);
      if (dist(prev.getX(), prev.getY(), b.getX(), b.getY()) >= 15) {
        b.setMoving(true);
        // NEXT STEP: utilize getVectors
        b.setXDir(1);
        b.setYDir(1);
        chamberedBall++;
      }
      if(chamberedBall==balls.size()){
        unchamber = false;
        nextStart = -1;
      }
      //b.setDirX(vectors[0]);
      //b.setDirY(vectors[1]);
    }
  }
}
/*
    while(i<balls.size())
 Ball b = balls.get(i);
 b.setX(nextStart);
 b.setMoving(true);
 b.setXDir(1);
 b.setYDir(1);
 //b.setDirX(vectors[0]);
 //b.setDirY(vectors[1]);
 }
 */
