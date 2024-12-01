/*credits
  Main menu background image by InkImagine: https://www.deviantart.com/inkimagine/art/Pixel-Art-Landscape-1026346241
*/

boolean inMenu = true;
boolean inPlay = false;
boolean gameOver = false;
PImage menuBackground;

void setup() {
 size(400,400);
 imageMode(CENTER);
 menuBackground = loadImage("MainMenu.jpg");
}

void draw() {
  background(255);
  if(inMenu){
   displayMenu(); 
  }
}

void displayMenu(){
 image(menuBackground, width/2, height/2);
 
}

void mouseReleased(){
 if (mouseX > 75 && mouseX<325 && mouseY>225 && mouseY<315){ //play button constraints
  inMenu = false;
  inPlay = true;
 }
}
