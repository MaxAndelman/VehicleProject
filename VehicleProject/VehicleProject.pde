//gobal variables
public boolean isGameOver = false;
public int score = 0;
public int fps = 50;
public int highScore = 0;
public static final float PHI = (1 + sqrt(5))/2;
public String gameState = "startScreen";

//Initiate Objects Here
Car lmq = new Car (100, 200, 255, 0, 0); //player
//other cars
ChaseCar chaseCar = new ChaseCar(500, 500, 255, 255, 255, 5, 77);
ChaseCar chaseCar2 = new ChaseCar(600, 400, 0, 0, 0, 7, 98);
ChaseCar chaseCar3 = new ChaseCar(700, 500, 200, 100, 0, 12, 65);
Heli[] helis = new Heli[7]; //array where helis will be stored

public void setup() {
  size(1000, 1000);
  frameRate(fps);
  //create helis
  for (int i = 0; i < helis.length; i++) {
    helis[i] = new Heli((int)random(1000), (int)random(1000), (int)random(-10, 10), (int)random(-10, 10), (int)random(255), (int)random(255), (int)random(255));
  }
}

public void draw() {
  if (gameState == "startScreen") {
    startScreen();
  } else if (gameState == "gameStarted") {
    drawGame();
  } else if (gameState == "gameOver") {
    gameOverScreen();
  }
}

public void drawGame() {
  background(255);
  //move and draw cars
  lmq.drawIt();
  chaseCar.move();
  chaseCar.drawIt();
  chaseCar2.move();
  chaseCar2.drawIt();
  chaseCar3.move();
  chaseCar3.drawIt();
  lmq.move();
  //move, draw, and check for heli collisions
  for (Heli h : helis) {
    h.move();
    h.drawIt();
    if (h.hitbox.collidingWith(lmq.hitbox) && score > 30) { //score > 30 gives .5 sec grace period at start of game
      gameState = "gameOver";
    }
  }
  //check for collisions
  if (chaseCar.hitbox.collidingWith(lmq.hitbox) || chaseCar2.hitbox.collidingWith(lmq.hitbox) || chaseCar3.hitbox.collidingWith(lmq.hitbox)) {
    gameState = "gameOver";
  }
  score++;
  fill(0);
  text("Score: " + score, 50, 50);
  //increase fps every 50 frames
  if (score % 50 == 0) {
    fps += 3;
    frameRate(fps);
  }
}

public void startScreen() {
  textAlign(CENTER);
  textSize(20);
  background(0);
  fill(255);
  text("Control the red car with WASD\nAvoid the other cars and helicopters\nPress Enter to start", height/2, width/2);
  if (keyPressed && key == ENTER) {
    gameState = "gameStarted";
  }
}

public void gameOverScreen() {
  //update high score
  if (score > highScore) {
    highScore = score;
  }

  background(0);
  fill(255);
  text("GAME OVER\nPress Enter to restart\nScore: " + score + "\nHigh Score: " + highScore, height/2, width/2);
  if (keyPressed && key == ENTER) {
    gameState = "gameStarted";
    score = 0;
    //restart the helis and cars
    for (int i = 0; i < helis.length; i++) {
      helis[i] = new Heli((int)random(1000), (int)random(1000), (int)random(-10, 10), (int)random(-10, 10), (int)random(255), (int)random(255), (int)random(255));
    }
    lmq = new Car (100, 200, 255, 0, 0);
    chaseCar = new ChaseCar(500, 500, 255, 255, 255, 5, 77);
    chaseCar2 = new ChaseCar(600, 400, 0, 0, 0, 7, 98);
    chaseCar3 = new ChaseCar(700, 500, 200, 100, 0, 12, 65);

    fps = 50;
    frameRate(50);
  }
}
