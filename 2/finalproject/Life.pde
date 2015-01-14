class Life{
  float lX;
  float lY;
  int lSize = 10;
  boolean gone = false;
  PImage imgLife;
  
  Life(float x, float y){
    lX = x;
    lY = y;
    imgLife = loadImage("data/+ life icon new.png");
  }
  
  void display(){
  imageMode(CENTER);
  imgLife.resize(0,50);
  image(imgLife,lX, lY);
  }
  
  void move(){
  }
}
  
