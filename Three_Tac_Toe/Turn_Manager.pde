class TurnManager {
  int round;
  int turn;
  TurnManager() {
    turn = 1;
    round =0;
  }

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
