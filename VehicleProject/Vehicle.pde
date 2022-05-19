public class Vehicle {
  public int x;
  public int y;
  public int speedX = 10;
  public int r;
  public int g;
  public int u;
  public Rectangle hitbox;
  
  public Vehicle (int ix, int iy, int ir, int ig, int iu) {
    x = ix;
    y = iy;
    r = ir;
    g = ig;
    u = iu;
  }
  
  public void move () {
  }
  
  public void updateHitbox(){
  }
  
  public void drawIt () {
    fill(r, g, u);
    rect(x, y, 50, 30);
  }
}
