public class Heli extends Vehicle {
  private int offset = 0;
  public float speedY;

  public Heli (int ix, int iy, int iSX, float iSY, int ir, int ig, int iu) {
    super(ix, iy, ir, ig, iu);
    speedX = iSX;
    speedY = iSY;
    hitbox = new Rectangle(x - 10, y -25, 20, 50);
    hitbox.rotation = -1*atan2(speedX, speedY);
  }

  public Heli (int ix, int iy, int ir, int ig, int iu) {
    super(ix, iy, ir, ig, iu);
    speedY = 0;
    speedX = 5;
    hitbox = new Rectangle(x - 20, y - 50, 20, 50);
    hitbox.rotation = -1*atan2(speedX, speedY);
  }

  public void drawIt () {
    fill(r, g, u);
    pushMatrix(); //1
    translate(x, y);

    /*Rotate the heli to face the direction it's moving using arctan.
     Arctan function is multipled by -1 because rotate moves it clockwise but it needs to move counterclockwise.
     If else needed because arctan returns how much it needs to be rotated but from 1 of 2 possible 0's.
     rotate(-1*atan2(speedY, speedX)); could replace these 5 lines.*/
    if (speedY < 0) {
      rotate(PI-atan(speedX/speedY));
    } else {
      rotate(-1*atan(speedX/speedY));
    }
    ellipse(0, 0, 30, 50);
    rect(-2, -85, 4, 60);
    pushMatrix(); //2
    rotate(offset*PHI);
    offset++;
    for (int i = 0; i < 3; i++) {
      rect(0, 0, 1, 60);
      rotate(2*PI/3);
    }
    popMatrix(); //2
    popMatrix(); //1
  }

  public void move() {
    x += speedX;
    y += speedY;
    updateHitbox();
    //If on edge, turn around.
    if (x > width || x < 0) {
      speedX *= -1;
    }
    if (y > height || y < 0) {
      speedY *= -1;
    }
  }

  public void updateHitbox() {
    hitbox.x += speedX;
    hitbox.y += speedY;
    hitbox.rotation = -1*atan2(speedX, speedY);
  }
}
