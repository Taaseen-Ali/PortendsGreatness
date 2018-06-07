import java.util.ArrayList;
public class Board {
  ArrayList<Brick> bricks;
  ArrayList<BallPowerUp> balls;
  Launcher launcher;
  int level, shifts;
  boolean shifting;

  public Board() {
    shifting = true;
    shifts=0;
    level=1;
    launcher = new Launcher(this);
    bricks = new ArrayList<Brick>();
    balls = new ArrayList<BallPowerUp>();
  }

  void setup() {
    // temporary
    launcher.addBall();
    launcher.addBall();
    placeBlocks();
    placeBall();
  }

  // iterates through each brick to see if ball is colliding
  // if so, brick's hit counter is changed
  // BUG: sometimes collision is not detected
  Brick brickCollided(Ball b) {
    for (int i = 0; i < bricks.size(); i++) {
      Brick brick = bricks.get(i);
      if (!brick.isActive()) {
        bricks.remove(i);
        i--;
      } else if ((b.getX()+5 >= brick.getX()) && (b.getX()-5<= brick.getX() + 42)) {
        if ((b.getY()+5 >= brick.getY()) && (b.getY()-5 <= brick.getY() + 27)) {
          println("COLLIDED");
          brick.hit();
          return brick;
        }
      }
    }
    return null;
  }

  int ballCollided(Ball b) {
    for (int i=0; i<balls.size(); i++) {
      BallPowerUp powerUp = balls.get(i);
      if (dist(powerUp.getX(), powerUp.getY(), b.getX(), b.getY()) <=10){
        return i;
      }
    }
    return -1;
   
  }

  void incrementLevel() {
    level++;
  }
  void draw() {
    for (Brick brick : bricks) {
      brick.draw();
    }
    for (BallPowerUp b : balls) {
      b.draw();
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

    for (BallPowerUp b : balls) {
      b.setY(b.getY()+1);
    }
  }
  // randomly places block
  void placeBlock() {
    int x = (int)random(9)*40;
    for (Brick b : bricks) {
      if (b.getX()==x && b.getY()==0) {
        System.out.println(x);
        placeBlock();
        return;
      }
    }
    bricks.add(new Brick(x, 0, level));
  }

  void placeBlocks() {
    for (int i=0; i<(int)random(5)+1; i++) {
      placeBlock();
    }
  }

  void placeBall() {
    int x = (int)random(9)*40;
    for (Brick b : bricks) {
      if (b.getX()==x && b.getY()==0) {
        System.out.println(x);
        placeBlock();
        return;
      }
    }
    for (BallPowerUp b : balls) {
      if (b.getX()==x && b.getY()==0) {
        System.out.println(x);
        placeBlock();
        return;
      }
    }
    balls.add(new BallPowerUp(x+20, 12));
  }
}
