class Rope{
PImage rope100,rope110,rope150,rope200,rope270;
float rX,rY ;
int ropeNum ;
float ropL ;/**/
  void loadRope(){
    rope100 = loadImage("data/Rope 100.png");
    rope110 = loadImage("data/Rope 110.png");
    rope150 = loadImage("data/Rope 150.png");
    rope200 = loadImage("data/Rope 200.png");
    rope270 = loadImage("data/Rope 270.png");
  }
  
  Rope(int rNum,float x,float y){
    rope100 = loadImage("data/Rope 100.png");
    rope110 = loadImage("data/Rope 110.png");
    rope150 = loadImage("data/Rope 150.png");
    rope200 = loadImage("data/Rope 200.png");
    rope270 = loadImage("data/Rope 270.png");
    ropeNum = rNum ;
    rX = x ;
    rY = y ;
    switch(ropeNum){
      case 0:
      ropL = 100 ;
      
      break;
      case 1:
      ropL = 110 ;
      
      break;
      case 2:
      ropL = 150 ;
      
      break;
      case 3:
      ropL = 200 ;
      
      break;
      case 4:
      ropL = 270 ;
      
      break;      
    }
    
  }
  void display(){
    if (ropeNum == 0){
      image(rope100,rX,rY);
    }else if (ropeNum == 1){
      image(rope110,rX,rY);
    }else if (ropeNum == 2){
      image(rope150,rX,rY);
    }else if (ropeNum == 3){
      image(rope200,rX,rY);
    }else if (ropeNum == 4){
      image(rope270,rX,rY); 
    }
  }

  void move(){
    rX-=2 ;
  }
   
     
  

}
