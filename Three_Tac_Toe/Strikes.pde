class Strikes {
  
  PVector startCoords;
  PVector endCoords;
  PVector velocity;
  PVector acceleration = new PVector(0.4,0);
  int getFrameCount;
  Strikes(PVector tempStartCoords, PVector tempEndCoords) {
    startCoords = tempStartCoords;
    endCoords = tempEndCoords;
    velocity = new PVector(0,0);
    getFrameCount = frameCount;
  }
  
  void drawStrike(){
    strokeWeight(3);
    stroke(255,0,0);
    line(startCoords.x, startCoords.y, endCoords.x, endCoords.y);
    if ((frameCount-getFrameCount)%180 == 179){
     inPlay = false;
     clickEnabled = true;
     gameOver = true;
    }
  }
}
