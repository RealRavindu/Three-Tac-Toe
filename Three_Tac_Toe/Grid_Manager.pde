class GridManager {
  Tiles t;
  float perlinC;
  ArrayList<Tiles> tileList = new ArrayList<Tiles>();
  GridManager() {

    for (int x=0; x<10; x++) {
      for (int y=0; y<10; y++) {
        PVector tempCoordinates = new PVector(x*40 + 20, y*40 + 20);
        t = new Tiles(0, tempCoordinates);
        println("tile coords: "+tempCoordinates);
        tileList.add(t);
      }
    }
  }

  void displayColorGrid() {
    for (int x=0; x<10; x++) {
      for (int y=0; y<10; y++) {
         perlinC +=0.00001;
         fill(100,50,255-255*noise(perlinC+noise(x)+noise(y)));
         rect(40*x + 20, 40*y + 20, 40, 40);
      }
    }
  }
  
  void displayPlayingGrid() {
   for (Tiles t: tileList){
    t.displayTile(); 
   }
  }
}
