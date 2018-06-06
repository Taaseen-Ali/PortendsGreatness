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
  
  // iterates through each brick to see if ball is colliding
  // if so, brick's hit counter is changed
  // BUG: sometimes collision is not detected
  Brick hasCollided(Ball b){
    for(int i = 0; i < bricks.size(); i++){
      Brick brick = bricks.get(i);
      if (brick.isActive()) {
        if((b.getX() >= brick.getX()) && (b.getX()<= brick.getX() + 42)){
          if((b.getY() >= brick.getY()) && (b.getY() <= brick.getY() + 27)){
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
  
  // calls fire function in launcher
  void mouseClick() {
    launcher.fire();
  }

  // randomly places block
  void placeBlock() {
    // size + 2
    bricks.add(new Brick((int)random(9)*42, (int) random(10)*27));
  }
}
