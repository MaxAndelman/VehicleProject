public class Car extends Vehicle {
  private int hoAcc = 0;
  private int vertAcc = 0;
  //constructor
  public Car (int ix, int iy, int ir, int ig, int iu) {
    super(ix, iy, ir, ig, iu);
     hitbox = new Rectangle(x - 50, y - 20, 50, 20);
  }

//move car without mouse
  public void move (int speed) {
    speedX = speed;
    x += speedX;
  }

//move car with mouse
  public void move () {
    if (keyPressed) {
      if (keyCode == LEFT) {
        if (hoAcc > -15) {
          hoAcc -= 2;
        }
      }
      if (keyCode == RIGHT) {
        if (hoAcc < 15) {
          hoAcc += 2;
        }
      }
      if (keyCode == UP) {
        if (vertAcc > -15) {
          vertAcc -= 2;
        }
      }
      if (keyCode == DOWN) {
        if (vertAcc < 15) {
          vertAcc += 2;
        }
      }
    }
    if ((x > width && hoAcc > 0) || (x < 50 && hoAcc < 0)) {
      hoAcc /= -2;
    }
    if ((y > height - 7 && vertAcc > 0)|| (y < 50 && vertAcc < 0)) {
      vertAcc /= -2;
    }
    hoAcc = toZero(hoAcc);
    vertAcc = toZero(vertAcc);
    move(hoAcc);
    y += vertAcc;
    updateHitbox();
  }

  public void drawIt () {
    pushMatrix(); //1
    //This is here because ChaseCar's drawIt rotates before calling Car's drawIt, and translating it twice would mess things up
    if (!isChaseCar()) {
      translate(x, y);
    }
    fill (r, g, u);
    //The second push-pop is here because I made the car upside down and this was easier than redoing it.
    pushMatrix(); //2
    rotate(PI);
    rect(0, 0, 50, 10);
    quad(10, 10, 15, 20, 40, 20, 45, 10);
    popMatrix(); //2
    fill(0);
    ellipse(-40, 0, 7, 7);
    ellipse(-10, 0, 7, 7);
    //add a circle to lmq to give another way to differentiate it
    if(!isChaseCar()) {
      fill(255);
      ellipse(-27, -15, 10, 10);
    }
    popMatrix(); //1
  }

//Retruns a value closer to 0. Returns 0 if the input is 0.
  private int toZero (int x) {
    if (x > 0) {
      x--;
    } else if (x < 0) {
      x++;
    }
    return x;
  }
  
  public boolean isChaseCar() {
    return false;
  }
  
  public void updateHitbox() {
    hitbox.x += hoAcc;
    hitbox.y += vertAcc;
  }
}
