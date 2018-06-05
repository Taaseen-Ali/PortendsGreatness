public class Ball {
  int x, y, xdir, ydir, speed, nextStart;
  boolean moving;
  Board board;
  public Ball(int xpos, Board world) {
    x = xpos;
    y = 500;
    xdir = ydir = 0;
    speed = 3;
    moving = false;
    board = world;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int getXDir() { 
    return xdir;
  }
  int getYDir() { 
    return ydir;
  }

  void setX(int xpos) {
    x = xpos;
  }
  void setY(int ypos) {
    y = ypos;
  }  
  void setXDir(int x) { 
    xdir = x;
  }

  void setYDir(int y) { 
    ydir = y;
  }

  void setMoving(boolean b) { 
    moving = b;
  }

  void setStart(int s){
    nextStart = s;
  }

  boolean moving() {
    return moving;
  }
  
  boolean ready() {
    return x == nextStart;
  }

  void tweenToNextStart() {
    if (x > nextStart) {
      x -= speed;
    }
    else if (x < nextStart) {
      x += speed;
    }
    if (Math.abs(x-nextStart) < speed){
      x = nextStart;
    }
  }
  
  void draw() {
    if (getX()>400) {
      setXDir(-getXDir());
    }
    if (getX()<0) {
      setXDir(-getXDir());
    }
    if (getY()>500) {
      setMoving(false);
      setY(500);
    }
    if (getY()<0) {
      setYDir(-getYDir());
    }
    if (moving) {
      x += xdir * speed;
      y -= ydir * speed;
      
      Brick collision = board.hasCollided(this);
      if(collision!= null){
        int[] vectors = collision.getExitVectors(this);
        setXDir(vectors[0]);
        setYDir(vectors[1]);
      }
    }
    else {
      tweenToNextStart();
    }
    
    fill(0, 0, 255);
    ellipse(x, y, 10, 10);
  }
}
