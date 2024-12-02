class GridManager {
  Tiles t;
  float perlinC;
  ArrayList<Tiles> tileList = new ArrayList<Tiles>();
  GridManager() {

    for (int x=0; x<9; x++) {
      for (int y=0; y<9; y++) {
        PVector tempCoordinates = new PVector(x*44.4 + 22.2, y*44.4 + 22.2);
        t = new Tiles(0, tempCoordinates);
        println("tile coords: "+tempCoordinates);
        tileList.add(t);
      }
    }
  }

  void displayColorGrid() {
    for (int x=0; x<9; x++) {
      for (int y=0; y<9; y++) {
         perlinC +=0.0001;
         fill(100,50,255-255*noise(perlinC+noise(x)+noise(y)));
         rect(44.4*x + 22.2, 44.4*y + 22.2, 44.4, 44.4);
      }
    }
  }
  
  void displayPlayingGrid() {
   for (Tiles t: tileList){
    t.displayTile(); 
   }
  }
}
