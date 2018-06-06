public class Ball {
  int x, y, xdir, ydir, speed, nextStart;
  boolean moving;
  Board board;
  public Ball(int xpos, Board world) {
    x = xpos;
    y = 500;
    xdir = ydir = 0;
    speed = 3;
    nextStart = -1;
    moving = false;
    board = world;
  }

  // accessors
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

  boolean moving() {
    return moving;
  }
  
  boolean ready() {
    return x == nextStart;
  }
  
  // mutators
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

  // animates setting ball to next position
  void tweenToNextStart() {
    
    // if ball position greater than next, move left
    if (x > nextStart) {
      x -= speed;
    }
    
    // if less, move right
    else if (x < nextStart) {
      x += speed;
    }
    
    // used in case ball would skip over while animating
    if (Math.abs(x-nextStart) < speed){
      x = nextStart;
    }
  }
  
  void draw() {
    // changes x and y directions when at edges of board
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
    
    // deals with moving the ball
    if (moving) {
      x += xdir * speed;
      y -= ydir * speed;
      
      // detects collision and changes ball direction
      // BUG: ball sometimes phases through brick
      // FIX: getExitVectors
      Brick collision = board.hasCollided(this);
      if(collision!= null){
        int[] vectors = collision.getExitVectors(this);
        setXDir(vectors[0]);
        setYDir(vectors[1]);
      }
    }
    
    // moves the ball to the next starting position
    else {
      tweenToNextStart();
    }
    
    // draws the ball
    fill(0, 0, 255);
    ellipse(x, y, 10, 10);
  }
}
