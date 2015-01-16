class TA{
  PImage TA= loadImage("data/TA.png");
  int tx;
  int ty;
  int tsize=25;
  int tspeed;
    int state = 0;
  TA(int x, int y){
   tx = x;
   ty = y; 
    tspeed=1;
  }
 
void display() {
      image(TA,tx,ty);
  }
void move(){
   switch(state){
         case 0:
             ty+=tspeed;
             if(ty>400){
              state=1; 
             }
               break;
         case 1:
              tx+=tspeed;
              if(tx>255){
              state=2;
              }
             break;
         case 2:
           ty-=tspeed;
           if(ty<80){
               state=3;   
           } 
             break;
        case 3:
             tx+=tspeed;
            if(tx>324){
              state=4;
            }    
             break;
        case 4:     
           ty+=tspeed;   
            if(ty>400){
              state=5; 
             }  
             break;
       case 5:
         tx+=tspeed;
            if(tx>394){
              state=6;
            } 
            break;
        case 6:
         ty-=tspeed;
           if(ty<80){
               state=7;   
           }
           break;
        case 7:
         tx+=tspeed;
            if(tx>464){
              state=8;
            } 
            break;
        case 8:
         ty+=tspeed;   
            if(ty>400){
              state=9; 
             }  
             break;
        case 9:
          ty-=tspeed;
           if(ty<80){
               state=10;   
           }
            break;
        case 10:
        tx-=tspeed;
            if(tx<394){
              state=11;
            } 
           break;
        case 11:
        ty+=tspeed;   
            if(ty>400){
              state=12; 
             }  
             break;
         case 12:
         tx-=tspeed;
            if(tx<324){
              state=13;
            }    
             break; 
         case 13:
         ty-=tspeed;
           if(ty<80){
               state=14;
             }
               break;
         case 14:
           tx-=tspeed;
          if(tx<255){
           state=15;
              } 
           break;
        case 15:
        ty+=tspeed;   
            if(ty>400){
              state=16; 
             }  
        break;
        case 16:
          tx-=tspeed;
          if(tx<185){
           state=17;
              } 
           break;
        case 17:
         ty-=tspeed;
           if(ty<80){
           state=0;
         }
           break;
   }
}
}
