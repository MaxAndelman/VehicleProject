public class Rectangle {
  //instance vars
  public int x;
  public int y;
  public int l;
  public int w;
  public float rotation = 0;

  //constructors
  public Rectangle(int ix, int iy, int il, int iw) {
    x = ix;
    y = iy;
    l = il;
    w = iw;
  }
  public Rectangle(int ix, int iy, int il, int iw, float ir) {
    x = ix;
    y = iy;
    l = il;
    w = iw;
    rotation = ir;
  }

  public void drawIt() {
    pushMatrix();
    translate(x + l/2, y + w/2);
    rotate(rotation);
    translate(-l/2, -w/2);
    fill(0);
    rect(0, 0, l, w);
    fill(255);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }

  //how collisions will be checked
  public boolean collidingWith (Rectangle rectangle) {
    int maxX = x + l;
    int maxY = y + w;
    int rMaxX = rectangle.x + rectangle.l;
    int rMaxY = rectangle.y + rectangle.w;
      return (abs(maxX - rMaxX) < l) && (abs(maxY - rMaxY) < w);
  }
}
