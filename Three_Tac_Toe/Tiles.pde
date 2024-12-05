class Tiles {
  PVector coordinates;
  int type;
  int TN;

  Tiles(int tempType, PVector tempCoordinates, int tempTN) {
    coordinates = tempCoordinates;
    type = tempType;
    TN = tempTN;
  }
 //the types display only a png of a token wit hthe background removed
  void displayTile() {
    strokeWeight(3);
    if (type ==0) {
    }
    if (type ==1) {
      image(tokenList[0], coordinates.x, coordinates.y);
    }
    if (type ==2) {
      image(tokenList[1], coordinates.x, coordinates.y);
    }
    if (type ==3) {
      image(tokenList[2], coordinates.x, coordinates.y);
    }
  }
 //check if mouse is hovering over a tile's width and length from the coordinates
  boolean isMouseHovering() {
    if (mouseX>coordinates.x-20 && mouseX<coordinates.x+20 &&  mouseY>coordinates.y-20 && mouseY<coordinates.y+20) {
      return true;
    } else {
      return false;
    }
  }
}
