//Class for managing the grid being generated and drawn. Grid is drawn using tile objects created from the class Tiles.

class GridManager {
  Tiles t;
  float perlinC;
  ArrayList<Tiles> tileList = new ArrayList<Tiles>();
  GridManager() {
    int i =0; //this variable is used to count the number of tiles being created. Later used as the argument for tile number in the tile objects.
    for (int y=0; y<9; y++) { // 9 columns
      for (int x=0; x<9; x++) { //9 rows
        PVector tempCoordinates = new PVector(x*44.4 + 22.2, y*44.4 + 22.2); //Basically, for every 9 columns, there'll be 9 rows and in each row there'll be 9 tiles. All in all 81 tiles total. Used some calculator math to get 44.4 (400/9). Creating the PVector coordinates which is used for edge detection inside Score Manager.
        t = new Tiles(0, tempCoordinates, i); //arguments are type, coordinates (PVector) and tile number(int)
        tileList.add(t);
        i++;
      }
    }
  }

  void displayColorGrid() {
    strokeWeight(3);
    stroke(0);
    for (int y=0; y<9; y++) {
      for (int x=0; x<9; x++) {
        perlinC +=0.0001;
        fill(75, 50, 255-255*noise(perlinC+noise(x)+noise(y))); // using perlin noise to slowly change the blue value
        rect(44.4*x + 22.2, 44.4*y + 22.2, 44.4, 44.4); //rect uses coordinates to draw each rectangle
      }
    }
  }

  void displayPlayingGrid() {
    for (Tiles t : tileList) {
      t.displayTile(); //goes through every tile in the grid and draws the player token (can see how it works inside Tiles)
    }
  }
}
