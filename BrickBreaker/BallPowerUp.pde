class BallPowerUp { //class for powerup balls that give a user an additional ball in their queue
  int x, y;
  public BallPowerUp(int xpos, int ypos){
    x=xpos;
    y=ypos;
  }
  void draw() { //draws the balls in their position
    fill(0, 255, 0);
    ellipse(x, y, 10, 10);
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  
  void setX(int xpos) {
    x=xpos;
  }
  void setY(int ypos) {
    y=ypos;
  }
  
}
