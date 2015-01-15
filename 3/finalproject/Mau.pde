class Mau{
PImage mau1,mau2,mauJump,mauStand,mauDead;

boolean jump = false;
boolean goRight = false;
float positY = 275 ;
float x = 50, y = 225 , xSpeed = 0, ySpeed = 0, gravity = 0.13;
int onceJump = 0;

    Mau() {
      
      //loadImage
      mau1 = loadImage("data/mau1.png");
      mau2 = loadImage("data/mau2.png");
      mauJump = loadImage("data/mauJump.png");
      mauStand = loadImage("data/mauStand.png");
      mauDead = loadImage("data/mauDead.png");
      }
    
    void move(){
      if(goRight == false){
        image(mauStand,x,y);
      }
      
      //running
      if(goRight){    
        xSpeed = 2;
        x += xSpeed;
        y += ySpeed;       
        }
     if(jump && onceJump == 0){
       ySpeed = -5.3;
       jump = false;
       onceJump = 1;
     }else if ( ySpeed !=0){
       ySpeed += gravity;
     if ( y >=positY){
         y = positY;
         ySpeed = 0;
         onceJump = 0;
     }
     } 
  
 }
   void display(){
     if(goRight && ySpeed == 0){       
        if (frameCount%16 > 0 && frameCount%16 < 8){
          image(playbk,0,0);
          image(mauStand,x,y);
          }
        if (frameCount%16 > 8 && frameCount%16 < 12){
          image(playbk,0,0);          
          image(mau1,x,y);
          }
        if (frameCount%16 > 12 && frameCount%16 < 16){
          image(playbk,0,0);
          image(mau2,x,y);          
          }         
     }
    if(goRight && ySpeed !=0){
          image(playbk,0,0);
          image(mauJump,x,y);
    }
   }
}   
