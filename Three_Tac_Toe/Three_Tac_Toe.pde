/*credits
 Main menu background image by InkImagine: https://www.deviantart.com/inkimagine/art/Pixel-Art-Landscape-1026346241
 */

boolean inMenu = true;
boolean inPlay = false;
boolean gameOver = false;
GridManager GM = new GridManager();
TurnManager TM = new TurnManager();
ScoreManager SM = new ScoreManager();
PImage menuBackground;


void setup() {
  size(400, 400);
  imageMode(CENTER);
  rectMode(CENTER);
  menuBackground = loadImage("MainMenu.jpg");
}

void draw() {
  background(255);
  if (inMenu) {
    displayMenu();
  }
  if (inPlay) {
    GM.displayGrid();
  }
}

void startGame() {
  GM = new GridManager();
  TM = new TurnManager();
  SM = new ScoreManager();
}

void displayMenu() {
  image(menuBackground, width/2, height/2);
}

void mousePressed() {
  if (mouseX > 75 && mouseX<325 && mouseY>225 && mouseY<315 && inMenu) { //play button constraints
    inMenu = false;
    inPlay = true;
    println(inPlay);
  }
  if (inPlay) {
    for (Tiles t : GM.tileList) {
      if (t.isMouseHovering()) {
        println("tile clicked");
        t.type = TM.turn;
        TM.nextTurn();
      }
    }
  }
}
