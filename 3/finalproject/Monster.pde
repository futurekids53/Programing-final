class Monster{
PImage goldfish,goldfish2,shiro,shiro2;
float mX,mY ;
float fX,fY ;
boolean goRight = false;
boolean atk = false ;
int mNo ;
    Monster(int m,float x,float y) {
      mNo = m ;
      mX = x ;
      mY = y ;
      fX = x ;
      fY = y ;
      
      //loadImage
      goldfish = loadImage("data/goldfish.png");
      goldfish2 = loadImage("data/goldfish2.png");
      shiro = loadImage("data/shiro.png");  
      shiro2 = loadImage("data/shiro2.png");    
      
    }
   void display(float ropeX,float rLength){
      if(mNo == 0){
        image(goldfish,fX,fY);
        }
      if(mNo == 1){
        if(goRight){
        image(shiro2,mX,mY-27);
        mX+=2;
          if(mX > ropeX+rLength+1){
            goRight = false ;
          }
        }else{
          image(shiro,mX,mY-27);
          mX-=2 ;
          if(mX < ropeX){
            goRight = true ;
          }
            
        }
      }    
    }
   void move(){
     if(mNo ==1){
       mX-=2;
     }else{
     fX-=2;
   }
   }
   
   void fishAtck(){
     if(frameCount%120 > 60){
     image(goldfish2,fX,fY);
     atk = false ;   
     }else{
     atk = true;
     }
   }
}
