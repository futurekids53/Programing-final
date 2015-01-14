class Small{
  float smallX;
  float smallY;
  int smallSize = 10;
  boolean gone = false;
  PImage imgSmall;
  
  Small(float x, float y){
    smallX = x;
    smallY = y;
    imgSmall = loadImage("data/beach - small.png");
  }
  
  void display(){
  imageMode(CENTER);
  imgSmall.resize(0,50);
  image(imgSmall, smallX, smallY);
  }
  
  void move(){
  }
}
  
