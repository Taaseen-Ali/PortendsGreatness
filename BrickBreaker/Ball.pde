public class Ball {
  float x, y, xdir, ydir, speed, nextStart;
  boolean moving;
  Board board;
  public Ball(float xpos, Board world) {
    x = xpos;
    y = 500;
    xdir = ydir = 0;
    speed = 3;
    moving = false;
    board = world;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getXDir() { 
    return xdir;
  }
  float getYDir() { 
    return ydir;
  }

  void setX(float xpos) {
    x = xpos;
  }
  void setY(float ypos) {
    y = ypos;
  }  
  void setXDir(float x) { 
    xdir = x;
  }

  void setYDir(float y) { 
    ydir = y;
  }

  void setMoving(boolean b) { 
    moving = b;
  }

  void setStart(float s){
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
        float[] vectors = collision.getExitVectors(this);
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
