class Strikes {
  float getFrame;
  PVector startCoords;
  PVector endCoords;
  PVector diffCoords;
  PVector velocity;
  PVector acceleration = new PVector(0.4,0);
  int getFrameCount;
  Strikes(PVector tempStartCoords, PVector tempEndCoords) {
    getFrame = frameCount;
    startCoords = tempStartCoords;
    endCoords = tempEndCoords.copy();
    diffCoords = endCoords.sub(startCoords);
    velocity = new PVector(0,0);
    getFrameCount = frameCount;
  }
  
  void drawStrike(){
    strokeWeight(3);
    stroke(255,0,0);
    line(startCoords.x, startCoords.y, startCoords.x + diffCoords.x*constrain(map(((frameCount-getFrame)%120),0,59,0,1),0,1), startCoords.y + diffCoords.y*constrain(map(((frameCount-getFrame)%120),0,59,0,1),0,1));
    if ((frameCount-getFrameCount)%120 == 119){
     inPlay = false;
     clickEnabled = true;
     gameOver = true;
    }
  }
}
