class ScoreManager {
  Strikes strike;

  ScoreManager() {
  }

  void checkStrikes() {
    println("check strikes called in round: " + TM.round);
    for (Tiles t : GM.tileList) {
      if (t.type != 0) {
        println("Checking tile at coords: " + (t.coordinates.x/44.4 +0.5) + ", " + (t.coordinates.y/44.4+0.5) + " Tyle type: " + t.type);
        if (GM.tileList.get(t.TN-9).type == t.type && GM.tileList.get(t.TN+9).type == t.type) {
          strikeFound(GM.tileList.get(t.TN-9).coordinates, GM.tileList.get(t.TN+9).coordinates);
        }
        if (GM.tileList.get(t.TN-11).type == t.type && GM.tileList.get(t.TN+11).type == t.type) {
          strikeFound(GM.tileList.get(t.TN-11).coordinates, GM.tileList.get(t.TN+11).coordinates);
        }
        if (GM.tileList.get(t.TN-10).type == t.type && GM.tileList.get(t.TN+10).type == t.type) {
          strikeFound(GM.tileList.get(t.TN-10).coordinates, GM.tileList.get(t.TN+10).coordinates);
        }
        if (GM.tileList.get(t.TN-1).type == t.type && GM.tileList.get(t.TN+1).type == t.type) {
          strikeFound(GM.tileList.get(t.TN-1).coordinates, GM.tileList.get(t.TN+1).coordinates);
        }
      }
    }
  }

  void strikeFound(PVector tempStartCoords, PVector tempEndCoords) {
    clickEnabled = false;
    strike = new Strikes(tempStartCoords, tempEndCoords);
  }
}
