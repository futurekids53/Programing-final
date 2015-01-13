class EyeLaser {

  int eX;
  int eY;
  float eSpeed;
  int eSize = 200;
  float rot=0;
  int state;
  int ang =0;


  EyeLaser() {
    eX = teacher.tX;
    eY = teacher.tY;
  }

  void display() {
    fill(28, 213, 128);
    arc(this.eX, this.eY, eSize*2, eSize*2, radians(ang), radians(ang+30));
  }

  void move(Teacher teacher) {
      this.eX=teacher.tX;
      this.eY=teacher.tY;
      ang += 2;
      pushMatrix();
       translate(this.eX,this.eY);
       float radSec = 360 / 60 ;
       rotate(radians(radSec));
      popMatrix();
  

  switch(state){
   case 0:
   eX += 1;
   if(eX > 590){
     eX = 590;
     state = 1;
   }
   break;
   
   case 1:
   eY += 1;
   if(eY > 430){
     eY = 430;
     state = 2;
   }
   break;
   
   case 2:
   eX -= 1;
   if(eX < 50){
     eX = 50;
     state = 3;
   }
   break;
   
   case 3:
   eY -= 1;
   if(eY < 50){
     eY = 50;
     state = 0;
   }
   break;
   }
}
  
  
}
