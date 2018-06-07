import java.util.LinkedList;
public class Launcher {
  LinkedList<Ball> balls;
  Board board;
  float nextStart;
  int chamberedBall, brickShifts;
  boolean allDone, unchamber, needsReset;
  float mx= mouseX;
  float my= mouseY;

  Launcher(Board b) {
    balls = new LinkedList<Ball>();
    board = b;
    nextStart = 200;
    chamberedBall = brickShifts = 0;
    allDone = true;
    unchamber = false;
    needsReset = false;
  }

  void draw() {
    // determines if all balls are done without affecting actual allDone
    boolean tempAllDone = true;
    // unchambers balls if they are chambered
    if (unchamber) unchamber();
    if(needsReset&&allDone){
      board.shiftDown();
      brickShifts++;
      if(brickShifts==25){
        needsReset = false;
        brickShifts = 0;
        board.placeBlocks();
      }
    }
    // draws each ball and determines state
    for (Ball b : balls) {
      b.draw();

      // if nextStartPosition is found, set each balls start position
      if (nextStart > -1) {
        b.setStart(nextStart);
      }
      // determines first ball to return
      if (!b.moving() && nextStart == -1) {
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
  
  float[] getVectors() {
    float x = (mx-nextStart)/(500-my);
    float y = 1;
    return new float[] {x, y};
  }

  void addBall() {
    balls.add(new Ball(nextStart, board));
  }

  // fires balls if not fired
  void fire() {
    // mouse debounce
    if (allDone) {
      mx= mouseX;
      my= mouseY; 
      allDone = false;
      unchamber = true;
      needsReset = true;
      chamberedBall = 0;
    }
  }

  void reset() {
    
  }  

  // unloads each ball one at a time
  void unchamber() {
    float[] vectors = getVectors();
    println(vectors[0], vectors[1]);

    Ball b = balls.get(chamberedBall);
    b.setX(nextStart);  
    if (chamberedBall==0) {
      b.setMoving(true);
      // NEXT STEP: utilize getVectors
      b.setXDir(vectors[0]);
      b.setYDir(vectors[1]);
      chamberedBall++;
    } else {
      Ball prev = balls.get(chamberedBall-1);
      if (dist(prev.getX(), prev.getY(), b.getX(), b.getY()) >= 15) {
        b.setMoving(true);
        // NEXT STEP: utilize getVectors
        b.setXDir(vectors[0]);
        b.setYDir(vectors[1]);
        chamberedBall++;
      }
      if (chamberedBall==balls.size()) {
        unchamber = false;
        nextStart = -1;
      }
    }
  }
}
