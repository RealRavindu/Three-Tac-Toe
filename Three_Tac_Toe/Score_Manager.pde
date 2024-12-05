//Used to detect for strikes, initially was made to keep track of multiple scores because the plan wasn't to finish the game at one strike but was changed to just 1 due to mkae it more fun to play.

class ScoreManager {
  Strikes strike; //
  //2 booleans below are used to detect if a tile is on the edge of the grid. Important because if a tile is on the right edge, we don't want the game to check for a tile further right, it'll cause errors.
  boolean verticaledge = false;
  boolean horizontaledge = false;
  ScoreManager() {
  }

  void checkStrikes() {
    for (Tiles t : GM.tileList) {

  //first checking if tile is unowned
      if (t.type != 0) {

        //checking if the tile is on a horizontal or vertical edge
        if (t.coordinates.x >375 || t.coordinates.x < 22.3) {
          verticaledge = true;
        } else {
          verticaledge = false;
        }
        if (t.TN < 9 || t.TN >= 72) {
          horizontaledge = true;
        } else {
          horizontaledge = false;
        }
    //Checking tiles around selected tiles to see if there are 2 on OPPOSITE tile pairs. Special if conditions to prevent edge tiles from checking tiles that aren't on the board. Implementation log explains how pairs are detected.
        println("Checking tile at TN: " + (t.TN) + " |tile vertical: " + verticaledge + " | tile horizontal: " + horizontaledge);
        if (!horizontaledge && !verticaledge) {
          if (GM.tileList.get(t.TN-8).type == t.type && GM.tileList.get(t.TN+8).type == t.type) {
            strikeFound(GM.tileList.get(t.TN-8).coordinates, GM.tileList.get(t.TN+8).coordinates);
          }
          if (GM.tileList.get(t.TN-10).type == t.type && GM.tileList.get(t.TN+10).type == t.type) {
            strikeFound(GM.tileList.get(t.TN-10).coordinates, GM.tileList.get(t.TN+10).coordinates);
          }
        }
        if (!horizontaledge) {
          if (GM.tileList.get(t.TN-9).type == t.type && GM.tileList.get(t.TN+9).type == t.type) {
            strikeFound(GM.tileList.get(t.TN-9).coordinates, GM.tileList.get(t.TN+9).coordinates);
          }
        }
        if (!verticaledge) {
          if (GM.tileList.get(t.TN-1).type == t.type && GM.tileList.get(t.TN+1).type == t.type) {
            strikeFound(GM.tileList.get(t.TN-1).coordinates, GM.tileList.get(t.TN+1).coordinates);
          }
        }
      }
    }
  }


//function that's called if a strike is found. Turns clicking off and creates a new strike object.
  void strikeFound(PVector tempStartCoords, PVector tempEndCoords) {
    clickEnabled = false;
    strike = new Strikes(tempStartCoords, tempEndCoords);
  }
}
