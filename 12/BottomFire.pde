class BottomFire {
  PImage imgB;
  
  BottomFire(){
    imgB = loadImage("data/bottom_fire.png");
  }
  
  void display(){
     imageMode(CORNER);
     translate(-400,0); 
     for(int i = 0; i < 400 ; i+=40){
       translate(40,0);
       image(imgB,0,height-40,40,40); 
     }
  }
}
