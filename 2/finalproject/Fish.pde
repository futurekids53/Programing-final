class Fish {

  float fX;
  float fY;
  float fSpeedX = 0;
  float fSpeedY = 0;
  int fSize = 3;
  boolean gone = false;
  PImage imgFish;


  Fish(float x, float y, float speedY, float speedX) {
    fX = x;
    fY = y;
    fSpeedY = speedY;
    fSpeedX = speedX;
    imgFish = loadImage("data/beach cat weapon01.png");
  }

  void display() {
    imageMode(CENTER);
    imgFish.resize(0,30);
    image(imgFish, fX, fY);
  }

  void move() {
    fY+=fSpeedY;
    fX+=fSpeedX;
  }
}

