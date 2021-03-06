import java.util.ArrayList;
public class Board {
  ArrayList<Brick> bricks;
  ArrayList<BallPowerUp> balls;
  Launcher launcher;
  int level, shifts, score;
  boolean shifting;
  boolean gameOver;

  public Board() { //sets up board class containing collections of bricks and balls
    shifting = true;
    shifts=0;
    level=1;
    launcher = new Launcher(this);
    bricks = new ArrayList<Brick>();
    balls = new ArrayList<BallPowerUp>();
  }

  void setup() { //sets up the beginning screen, first level
    // temporary
    launcher.addBall();
    launcher.addBall();
    placeBlocks();
    placeBall();
  }

  // iterates through each brick to see if ball is colliding
  // if so, brick's hit counter is changed
  // if the coordinates of the ball intersects an edge of a brick, it is a collision

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
          score++;
          return brick;
        }
      }
    }
    return null;
  }

  int ballCollided(Ball b) {
    for (int i=0; i<balls.size(); i++) {
      BallPowerUp powerUp = balls.get(i);
      if (dist(powerUp.getX(), powerUp.getY(), b.getX(), b.getY()) <=10) {
        return i;
      }
    }
    return -1;
  }

  void incrementLevel() {
    level++;
  }
  void draw() {
    fill(0);
    rect(0,305,400,2);
    text("SCORE: " + score, 200 - textWidth(("SCORE: " + score))/2, 330);
  // calls draw method from brick
    for (Brick brick : bricks) {
      brick.draw();
    }
  // calls draw method from BallPowerUp
    for (BallPowerUp b : balls) {
      b.draw();
    }
    launcher.draw();
    if (gameOver) {
      background(0, 0, 0);
      textSize(26);
      text("GAME OVER", 125, 150);
    }
  }

  // calls fire function in launcher
  void mouseClick() {
    launcher.fire();
  }

// shifts the bricks down after each launch
  void shiftDown() {
    for (Brick b : bricks) {
      b.setY(b.getY()+1);
      //if a brick reaches the bottom of the screen, the endgame screen is launched
      if (b.getY()+25 >= 300) {
        gameOver = true;
      }
    }
   // shifts the power up balls
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
        placeBall();
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
