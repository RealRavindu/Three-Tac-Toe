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
  }
 
}
