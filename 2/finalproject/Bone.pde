class Bone {

  float bX;
  float bY;
  float bSpeedX = 0;
  float bSpeedY = 0;
  int bSize = 3;
  boolean gone = false;
  PImage imgBone;


  Bone(float x, float y, float speedY, float speedX) {
    bX = x;
    bY = y;
    bSpeedY = speedY;
    bSpeedX = speedX;
    imgBone = loadImage("data/beach dog weapon01 - bone.png");
  }

  void display() {
    imageMode(CENTER);
    imgBone.resize(0,30);
    image(imgBone, bX, bY);
  }

  void move() {
    bY+=bSpeedY;
    bX+=bSpeedX;
  }
}

