public class Brick {
  int x, y, red;
  Brick(int xpos, int ypos) {
    x = xpos;
    y = ypos;
    red = 255;
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  void draw() {
    rect(x, y, 40, 25);
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
