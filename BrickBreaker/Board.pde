import java.util.ArrayList;
public class Board {
  ArrayList<Brick> bricks;
  Launcher launcher;
  int level, shifts;
  boolean shifting;

  public Board() {
    shifting = true;
    shifts=0;
    launcher = new Launcher(this);
    bricks = new ArrayList<Brick>();
  }

  void setup() {
    // temporary
    for (int i = 0; i < 22; i++) {
      launcher.addBall();
    }
    placeBlocks();
  }

  // iterates through each brick to see if ball is colliding
  // if so, brick's hit counter is changed
  // BUG: sometimes collision is not detected
  Brick hasCollided(Ball b) {
    for (int i = 0; i < bricks.size(); i++) {
      Brick brick = bricks.get(i);
      if(!brick.isActive()){
        bricks.remove(i);
        i--;
      }  
      else if ((b.getX()+5 >= brick.getX()) && (b.getX()-5<= brick.getX() + 42)) {
        if ((b.getY()+5 >= brick.getY()) && (b.getY()-5 <= brick.getY() + 27)) {
          println("COLLIDED");
          brick.hit();
          return brick;
        }
      }
    }
    return null;
  }

  void draw() {
    for (Brick brick : bricks) {
      brick.draw();
    }
    launcher.draw();
  }

  // calls fire function in launcher
  void mouseClick() {
    launcher.fire();
  }

  void shiftDown() {
    for (Brick b : bricks) {
      b.setY(b.getY()+1);
    }
  }
  // randomly places block
  void placeBlock() {
    int x = (int)random(9)*42;
    for (Brick b : bricks) {
      if (b.getX()==x && b.getY()==0) {
        System.out.println(x);
        placeBlock();
        return;
      }
    }
    bricks.add(new Brick(x, 0, 20));
  }

  void placeBlocks() {
    for (int i=0; i<(int)random(5)+1; i++) {
      placeBlock();
    }
  }
}
