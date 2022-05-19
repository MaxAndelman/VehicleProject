public class ChaseCar extends Car {
  private float rotation;
  private int speed;
  public float hoAcc;
  public float vertAcc;
  private int updateRate;
  public ChaseCar (int ix, int iy, int ir, int ig, int iu, int is, int iur) {
    super(ix, iy, ir, ig, iu);
    speed = is;
    updateRate = iur;
  }

  //return the rotation needed to face towords a vehicle
  public float faceTowords (Vehicle vehicle) {
    float rotate = atan2(vehicle.y - y, vehicle.x - x);
    return rotate;
  }


  public void drawIt () {
    pushMatrix();
    translate(x, y);
    super.drawIt();
    popMatrix();
  }

  public void move() {
    if (score % updateRate == 0) {
      update();
    }
    x += hoAcc;
    y += vertAcc;
    updateHitbox();
  }

  public boolean isChaseCar() {
    return true;
  }

  //Update variables so the car moves towords lmq
  private void update() {
    rotation = faceTowords(lmq);
    hoAcc = speed * cos(rotation);
    vertAcc = speed * sin(rotation);
  }

  public void updateHitbox() {
    hitbox.x += this.hoAcc;
    hitbox.y += this.vertAcc;
  }
}
