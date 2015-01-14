class Player {
  int speedL = 66;
  int speedR = 66;
  int speedU = 66;
  int speedD = 66;
  int playerSize = 30;
  int posX;
  int posY;
  boolean isPlay = true;
  PImage boy;

  Player(int x, int y) {
    this.posX = x;
    this.posY = y;
    boy = loadImage("data/boy1.png");
  } 

  void display() {
    image(boy, posX, posY);
  }


  void keyTyped() {

    if (key == CODED) {
      switch(keyCode) {
      case LEFT:
        this.posX -= speedL;
        break;
      case RIGHT:
        this.posX += speedR;
        break;
      case UP:
        this.posY -= speedU;
        break;
      case DOWN:
        this.posY += speedD;
        break;
      }
    }
  }
}
