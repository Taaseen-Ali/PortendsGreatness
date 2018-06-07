public class Brick {
  int x, y, red, hitsLeft, maxHits;
  Brick(int xpos, int ypos, int maxHits) {
    x = xpos;
    y = ypos;
    red = 255;
    this.maxHits = maxHits;
    hitsLeft = maxHits;
  }

  void draw() {
    if (hitsLeft > 0) {
      // front
      // noStroke();
      //fill(180);
      //rect(x+2, y+2, 40, 25);

      // shadow of the brick (aesthetic)
      noStroke();
      fill(255, 255*((maxHits-hitsLeft)/ (float)maxHits), 255*((maxHits-hitsLeft)/ (float)maxHits));
      rect(x, y, 40, 25);

      // displays hits needed
      fill(0);
      text(hitsLeft + "", x + 20 - textWidth((""+hitsLeft)) / 2, y + 12.5);
    }
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }

  void setX(int xpos) {
    x = xpos;
  }

  void setY(int ypos) {
    y = ypos;
  }

  // checks if brick is alive
  boolean isActive() {
    return hitsLeft > 0;
  }
  // reduces number of hits needed to break brick
  void hit() {
    hitsLeft -= 1;
  }

  // returns the change to make after ball collides with brick
  float[] getExitVectors(Ball b) {
    float[] ret = new float[2];
    if (b.getX()-4 >= x && b.getX()-4 <= x+ 40) {
      ret[0] = b.getXDir();
      ret[1] = -b.getYDir();
    } else if (b.getY()+4 >= y && b.getY()-4 <= y+25) {
      ret[0] = -b.getXDir();
      ret[1] = b.getYDir();
    } else {
      ret[0] =-b.getXDir();
      ret[1] = -b.getYDir();
    }
    return ret;
  }
}
