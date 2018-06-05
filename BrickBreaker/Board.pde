import java.util.ArrayList;
public class Board {
  ArrayList<Brick> bricks = new ArrayList<Brick>();
  Launcher launcher = new Launcher(this);
  int level;

  void setup() {
    bricks.add(new Brick(30, 30));
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    launcher.addBall();
    placeBlock();
  }
  
  Brick hasCollided(Ball b){
    for(Brick brick: bricks){
      if((b.getX() >= brick.getX()) && (b.getX()<= brick.getX() + 40)){
        if((b.getY() >= brick.getY()) && (b.getY() <= brick.getY() + 25)){
          println("COLLIDED");
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

  void mouseClick() {
    launcher.fire();
  }


  void placeBlock() {
    bricks.add(new Brick((int)random(11)*40, (int) random(10)*25));
  }
}
