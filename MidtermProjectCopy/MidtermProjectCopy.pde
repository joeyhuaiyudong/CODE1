//midterm
//inspired by https://flappybird.io
Rabbit myRabbit;
ArrayList<Wall> walls;
Wall myWall;
int screen;
int score = 0;
boolean clicked = false;
PImage bg;
PImage startBg;
void setup() {

  size(600, 800);
  myRabbit = new Rabbit(); 
  myWall = new Wall();
  walls = new ArrayList<Wall>();
  bg = loadImage("https://static-vectorplace-com.ams3.digitaloceanspaces.com/uploads/works/72114/thumb_72114.jpg");
  bg.resize(600, 800);
  startBg = loadImage("https://i.pinimg.com/564x/b8/68/a2/b868a211e558b75a1949861f4165d130.jpg");
  startBg.resize(600, 800);
}


void draw() {

  switch(screen) {
  case 0:
    startScreen();
    break;
  case 1:
    gameScreen();
    break;
  case 2:
    endScreen();
    break;
  }

  //  println(frameCount);
}

void mousePressed() {
  if (screen == 0) {
    screen = 1;
  }
  if (screen ==1 ) {
    myRabbit.jump();
  }
  if (screen == 2) {
    screen = 0;
  }
}

void startScreen() {
  // background(26, 150, 255);
  background(startBg);
  textSize(30);
  fill(25,118,245);
  text("Click to start", 350, 650);
  text("JUMPING RABBIT", 100, 100);
  text("Click to operate the rabbit to jump through the walls!", 100, 200, 500, 200);
  score = 0;
}

void gameScreen() {
  background(bg);
  frameRate(125);
  fill(255);
  rect(20, 20, 100, 50);
  fill(0);
  text(score, 30, 60);

  //rabbit function
  myRabbit.drawRabbit();
  myRabbit.move();

  //wall function
  if (frameCount % 250 ==0) {
    walls.add(new Wall());
  }

  for (int i =0; i<walls.size(); i++) {
    Wall w = walls.get(i);
    w.update();
    w.drawWall();
    //check if wall is outside of screen
    if (w.xWall + w.wallWidth < 0) {
      walls.remove(i);
    }
    if (myRabbit.hasCrashed(w)) {
      screen = 2;
    }
    if (w.xWall == 250 && myRabbit.hasCrashed(w) == false) {
      score ++;
    }
  }
  //myWall.update();
  //myWall.drawWall();
}

void endScreen() {
  //background(26, 150, 255);
  background(0);
  textSize(30);
  fill(255, 95, 245);
  text("Click to restart", 350, 550);
  text("GAME OVER", 100, 200);
  text("Your score is", 100, 300);
  text(score, width/2, height/2);
  walls.clear();
}
