class RightFire{
  
  //propoties
  PImage imgR;
  
  RightFire(){
   imgR = loadImage("data/right_fire.png"); 
  }
  
  void display(){
    imageMode(CORNER);
    image(imgR,0,0,40,40); 
  }
  
}
