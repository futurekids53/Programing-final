class TopFire {
  PImage imgT;
  
  TopFire(){
    imgT = loadImage("data/top_fire.png");
  }
  
  void display(){
     imageMode(CORNER);
     translate(-40,0); 
     for(int i = 0; i < 400 ; i+=40){
       translate(40,0);
       image(imgT,0,0,40,40); 
     }
  }
}
