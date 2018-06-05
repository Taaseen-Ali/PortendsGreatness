import java.util.LinkedList;
public class Launcher {
  int lastX;
  LinkedList<Ball> balls;
  boolean allDone;
  Board board;
  boolean firing = false;
  int chamberedBall = 0;

  Launcher(Board b) {
    lastX = 200;
    balls = new LinkedList<Ball>();
    allDone = true;
    board = b;
  }

  void draw() {
    if(firing) firing();
    for (Ball b : balls) {
      b.draw();
      if (!b.moving() && lastX == -1)
        lastX = b.getX();
    }
  }

  int[] getAngle(int x, int y) {
    return new int[] {1, 1};
  }

  void addBall() {
    balls.add(new Ball(lastX, board));
  }

  void fire() { 
    firing = true;
    chamberedBall = 0;
  }

  void firing() {
    int[] vectors = getAngle(mouseX, mouseY);

    Ball b = balls.get(chamberedBall);
    b.setX(lastX);  
    if (chamberedBall==0) {
      b.setMoving(true);
      b.setXDir(1);
      b.setYDir(1);
      chamberedBall++;
    } else {
      Ball prev = balls.get(chamberedBall-1);
      if (dist(prev.getX(), prev.getY(), b.getX(), b.getY()) >= 15) {
        b.setMoving(true);
        b.setXDir(1);
        b.setYDir(1);
        chamberedBall++;
      }
      if(chamberedBall==balls.size()){
        firing = false;
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
