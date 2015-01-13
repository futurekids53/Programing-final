class Teacher {
  PImage teacher = loadImage("t.png");
  int speedL = 10;
  int speedR = 10;
  int tSize = 50;
  int tX;
  int tY;
  int state = 0;

  Teacher(int x, int y) {
    this.tX = x;
    this.tY = y;
  } 
  
  void display() {
    imageMode(CENTER);
  //  object0.resize(0,40);
    image(teacher,tX,tY);
    
  }
  
  
void move(){
   
   switch(state){
         case 0:
               tX -= 1;
              if(tX < 75){
                  tX = 75;
                  state = 1;
              }
             break;
             
         case 1:
              tY -= 1;
             if(tY < 70){
                tY = 70;
                state = 2;
             }
             break;
             
         case 2:
              tX += 1;
               if(tX > 560){
                  tX = 560;
                  state = 3;
               }
               break;
   
        case 3:
             tY += 1;
              if(tY > 420){
                tY = 420;
                state = 4;
             }
             break;
     }   
  }

}
