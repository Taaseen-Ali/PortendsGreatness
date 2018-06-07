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
    for (int i = 0; i < 30; i++) {
    placeBlock();
    }
  }
  
  Brick hasCollided(Ball b){
    for(int i = 0; i < bricks.size(); i++){
      Brick brick = bricks.get(i);
      if (brick.isActive()) {
        if((b.getX() >= brick.getX()) && (b.getX()<= brick.getX() + 42)){
          if((b.getY()+5 >= brick.getY()) && (b.getY() <= brick.getY() + 27)){
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
    // size + 2
    bricks.add(new Brick((int)random(9)*42, (int) random(10)*27));
  }
}
