class Wall{
  float wallHeight, wallWidth, opening, xWall,wallSpeed;
  boolean scored = false;
  //float xWall[];
  Wall(){
   xWall = width;
   wallSpeed = 1;
   opening = random(200,300);
    wallWidth = 20;
    wallHeight = random(200,500);
    //float xWall [] = new float [5]; 
  }
  
  void update(){
    xWall -= wallSpeed;
  }
  
  void drawWall(){
    fill(155,64,11);
    rect(xWall, 0, wallWidth, wallHeight);
    rect(xWall, wallHeight+opening, wallWidth, (height - (wallHeight +opening)));
    //rect(xWall, 0, wallWidth, wallHeight);
    //rect(xWall, 800-wallHeight, wallWidth, wallHeight);
  }
}
