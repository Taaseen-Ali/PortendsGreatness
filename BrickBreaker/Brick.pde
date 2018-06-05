public class Brick {
  int x, y, red, hitsLeft;
  Brick(int xpos, int ypos) {
    x = xpos;
    y = ypos;
    red = 255;
    // temporary
    hitsLeft = 10;
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  void draw() {
    if (hitsLeft > 0) {
      fill(255);
      rect(x, y, 40, 25);
      fill(0);
      text(hitsLeft + "", x + 20 - textWidth((""+hitsLeft)) / 2, y + 12.5);
    }
  }
  
  void hit() {
    hitsLeft -= 1;
  }
  
  boolean isActive() {
    return hitsLeft > 0;
  }
   
  int[] getExitVectors(Ball b) {
    int[] ret = new int[2];
    if (b.getX()> x && b.getX() < x + 40) {
      ret[0] = b.getXDir();
      ret[1] = -b.getYDir();
    } else {
      ret[0] = -b.getXDir();
      ret[1] = b.getYDir();
    }
    return ret;
  }
}
