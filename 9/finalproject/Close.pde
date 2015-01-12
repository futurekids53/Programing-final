class Close{
  
  int x;
  int y;
  boolean pressed = false;
 
 Close(int cx, int cy){
   this.x = cx;
   this.y = cy;
 }
 
 void display(){
   PImage closeButton = loadImage("close.png");
   image(closeButton, this.x, this.y);
 }
 

 void keyDetect(){
   if(keyPressed){
    
     if(key == '/'){
     door.lx = 100;
     door.rx = 320;
     pressed = true;
     open.pressed = false;
     
     
     
     
     
     }
   }
 }

 
}
