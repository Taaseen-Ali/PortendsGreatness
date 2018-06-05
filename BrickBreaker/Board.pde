import java.util.ArrayList;
public class Board {
  ArrayList<Brick> bricks = new ArrayList<Brick>();
  Launcher launcher = new Launcher(this);
  int level;

  void setup() {
    // temporary
    for (int i = 0; i < 22; i++){
      launcher.addBall();
    }
    // temporary
    for (int i = 0; i < 5; i++) {
    placeBlock();
    }
  }
  
  Brick hasCollided(Ball b){
    for(int i = 0; i < bricks.size(); i++){
      Brick brick = bricks.get(i);
      if (brick.isActive()) {
        if((b.getX() >= brick.getX()) && (b.getX()<= brick.getX() + 40)){
          if((b.getY() >= brick.getY()) && (b.getY() <= brick.getY() + 25)){
            println("COLLIDED");
            brick.hit();
            return brick;
          }
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
