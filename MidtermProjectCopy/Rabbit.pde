class Rabbit {
  float xPos, yPos, ySpeed, gravity ;
  float groundY; 
  boolean jumping = false;
  Rabbit() {
    xPos = 300;
    yPos = 400;

    //gravity = 0.4;
    gravity = 0.3;
    ySpeed = 0; 
    groundY = height;
  }

  boolean hasCrashed(Wall wall) {
    boolean result = false;
    //  if(xPos == wall.xWall){
    if (xPos>wall.xWall && xPos<(wall.xWall+wall.wallWidth)&& (yPos<wall.wallHeight || yPos > wall.wallHeight+wall.opening)) {
      result = true;
      //println(result);
    }
    return result;
  }

  void drawRabbit() {
    fill(255,95,245);
    noStroke();
    ellipse(xPos, yPos, 30, 30);
    ellipse(xPos-7, yPos-10, 10, 30);
    ellipse(xPos+7, yPos-10, 10, 30);
  }

  void jump() {
    ySpeed = -10;
    ySpeed += gravity;
    jumping = true;
  }
  //  if (mousePressed) {
  //    clicked =! clicked;
  //  }
  //  if (clicked == true) {
  //    ySpeed = -10;
  //  } else {
  //    ySpeed = 1;
  //  }
  //}

  void mousePressed() {
    clicked =! clicked;
  }
  void move() {
    yPos = yPos + ySpeed;
    gravity();
  }

  void gravity() {
    if (yPos<groundY) {
      ySpeed += gravity;
    } else {
      yPos = groundY;
      ySpeed = 0;
      jumping = false;
    }
  }
}
