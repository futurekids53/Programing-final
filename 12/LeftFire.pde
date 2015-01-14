class LeftFire{
  
  //propoties
  PImage imgL;
  
  LeftFire(){
   imgL = loadImage("data/left_fire.png"); 
  }
  
  void display(){
    imageMode(CORNER);
    image(imgL,0,0,40,40); 
  }
  
}
