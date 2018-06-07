class BallPowerUp {
  int x, y;
  public BallPowerUp(int xpos, int ypos){
    x=xpos;
    y=ypos;
  }
  void draw() {
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
