public class Ball {
  float x, y, xdir, ydir, speed, nextStart;
  boolean moving;
  Board board;
  public Ball(float xpos, Board world) {
    x = xpos;
    y = 500;
    xdir = ydir = 0;
    speed = 3;
    nextStart = -1;
    moving = false;
    board = world;
  }

  // accessors
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

  boolean moving() {
    return moving;
  }
  
  boolean ready() {
    return x == nextStart;
  }
  
  // mutators
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
      Brick collision = board.brickCollided(this);
      if(collision!= null){
        float[] vectors = collision.getExitVectors(this);
        setXDir(vectors[0]);
        setYDir(vectors[1]);
      }
    }
    
    // moves the ball to the next starting position
    else {
      tweenToNextStart();
    }
   
    int ballNum = board.ballCollided(this);
    if(ballNum!=-1){
      board.launcher.addNewBall();
      board.balls.remove(ballNum);
      System.out.println("dskljkjgdsgh");
    }
   

    
    // draws the ball
    fill(0, 0, 255);
    ellipse(x, y, 10, 10);
  }
}
