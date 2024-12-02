class TurnManager {

  int turn;
  TurnManager() {
    turn = 1;
  }

  void nextTurn() {
    if (turn ==3) {
      turn =1;
    } else {
      turn++;
    }
  }
}
