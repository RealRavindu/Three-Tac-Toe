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

  void displayGrid() {
    for (Tiles t : tileList) {
      perlinC += 0.01;
      fill(100,0,map(noise(perlinC),0,1,0,255));
      t.displayTile();
    }
  }
}
