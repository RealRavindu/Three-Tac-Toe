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
PImage[] tokenList;


void setup() {
  size(400, 400);
  frameRate(60);
  imageMode(CENTER);
  rectMode(CENTER);
  menuBackground = loadImage("MainMenu.jpg");
  tokenList = new PImage[3];
  for (int i=0; i<3; i++) {
    tokenList[i] = loadImage("player token " + (i+1) + ".png");
    println("image added " + tokenList[i]);
  }
}

void draw() {
  background(255);
  if (inMenu) {
    displayMenu();
  }
  if (inPlay) {
    GM.displayColorGrid();
    GM.displayPlayingGrid();
    image(tokenList[TM.turn-1],mouseX, mouseY);
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
      if (t.isMouseHovering() && t.type ==0) {
        println("tile clicked");
        println("turn: " + TM.turn);
        t.type = TM.turn;
        println("tile's type: " + t.type);
        TM.nextTurn();
      }
    }
  }
}
