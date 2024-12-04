/*
Three-Tac-Toe
 by Ravindu Hewabaddage
 
 credits
 Main menu and game over background image by InkImagine: https://www.deviantart.com/inkimagine/art/Pixel-Art-Landscape-1026346241
 */

//booleans for screen switching
boolean inMenu = true;
boolean inPlay = false;
boolean gameOver = false;
//boolean to stop players from continuing to click after game is finished
boolean clickEnabled = true;
//objects to manage the grid and turn order and for detecting strikes
GridManager GM = new GridManager();
TurnManager TM = new TurnManager();
ScoreManager SM = new ScoreManager();
//object for drawing the strike

PImage menuBackground;
PImage gameOverBackground;
PImage[] tokenList; //player tokens like cross, circle and triangle


void setup() {
  size(400, 400);
  frameRate(60);
  imageMode(CENTER);
  rectMode(CENTER);
  menuBackground = loadImage("MainMenu.jpg");
  gameOverBackground = loadImage("GameOver.png");
  tokenList = new PImage[3];
  for (int i=0; i<3; i++) {
    tokenList[i] = loadImage("player token " + (i+1) + ".png");
    ////println("image added " + tokenList[i]);
  }
}

void draw() {
  background(255);
  if (inMenu) {
    displayMenu();
  }
  if (inPlay) {
    GM.displayColorGrid(); //background with changing colors
    GM.displayPlayingGrid(); //grid in whcih player tokens appear
    image(tokenList[TM.turn-1], mouseX, mouseY);
    if (!clickEnabled) {
      SM.strike.drawStrike(); //drawing a strike created in the score manager object.
    }
  }
  if (gameOver) {
    displayGameOver();
  }
}
//resets all the objects to the default state.
void startGame() {
  GM = new GridManager();
  TM = new TurnManager();
  SM = new ScoreManager();
}

void displayMenu() {
  image(menuBackground, width/2, height/2);
}
void displayGameOver() {
  image(gameOverBackground, width/2, height/2);
}

void mousePressed() {
  if (mouseX > 75 && mouseX<325 && mouseY>225 && mouseY<315 && inMenu) { //play button constraints + chekcing if the menu state is enabled
    inMenu = false; //so menu won't be drawn
    startGame(); //resets game managers to default
    inPlay = true; //game screen gets drawn
  }
  if (inPlay && clickEnabled) {
    for (Tiles t : GM.tileList) {
      if (t.isMouseHovering() && t.type ==0) { //checks every tile to see which one is hovered and playable (i.e. not owned by another player)
        t.type = TM.turn; //changes the type of the tile to that of the current player's
        TM.nextTurn(); //changes the turn which is basically adding 1 to TM.turn but also checking if it needs to be reset back to player 1. Otherwise it keeps on adding and ew'll have 7 players by turn 7.
      }
    }
    SM.checkStrikes(); //at the end of each turn we check for a strike (3-in-a-row)
  }
  if (mouseX >30.5 && mouseX <370.5 && mouseY > 275.5 && mouseY < 365.5 &&   gameOver) { //gameover button constraints + checking if the gameover state is enabled
    gameOver = false; //so gameover won't be drawn
    inMenu = true; //'takes you back' to the menu
  }
}
