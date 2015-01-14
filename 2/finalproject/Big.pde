class Big{
  float bigX;
  float bigY;
  int bigSize = 10;
  boolean gone = false;
  PImage imgBig;
  
  Big(float x, float y){
    bigX = x;
    bigY = y;
    imgBig = loadImage("data/beach - big.png");
  }
  
  void display(){
  imageMode(CENTER);
  //imgBig.resize(0,50);
  image(imgBig, bigX, bigY,76*50/124,50);
  }
  
  void move(){
  }
}
  
