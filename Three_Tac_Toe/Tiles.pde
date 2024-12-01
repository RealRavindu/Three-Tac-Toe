class Tiles {
  PVector coordinates;
  int type;

  Tiles(int tempType, PVector tempCoordinates) {
    coordinates = tempCoordinates;
    type = tempType;
  }

  void displayTile() {
    strokeWeight(3);
    rect(coordinates.x, coordinates.y, 40, 40);
    if(type ==0){
      
    }
    if(type ==1){
      
    }
    if(type ==2){
      
    }
    if(type ==3){
      
    }
  }
  
  boolean isMouseHovering(){
   if(mouseX>coordinates.x-20 && mouseX<coordinates.x+20 &&  mouseY>coordinates.y-20 && mouseY<coordinates.y+20){
    return true; 
   } else  {
    return false; 
   }
  }
}
