class TurnManager {

  int turn;
  TurnManager() {
    turn = 0;
  }

  void nextTurn() {
    if (turn ==2) {
      turn =0;
    } else {
      turn++;
    }
  }
}
