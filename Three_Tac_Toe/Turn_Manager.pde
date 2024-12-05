class TurnManager {
  int round;
  int turn;
  TurnManager() {
    turn = 1;
    round =0;
  }
// checks for which round it is. Set to 27 because thats the maximum number of rounds that you can have in a 9x9 grid. If it goes over the max number of turns it takes you to the game over screen. If the turn is 3 (which is the triangle or third player) it resets back to 1 (square or 1st player).
  void nextTurn() {
    if (clickEnabled) {
      if (turn ==3) {
        round++;
        if (round ==27) {
          inPlay = false;
          gameOver = true;
        }
        turn =1;
      } else {
        turn++;
      }
    }
  }
}
