class Open{
  
  int x;
  int y;
  boolean pressed = false;
 
 Open(int ox, int oy){
   this.x = ox;
   this.y = oy;
 }
 
 void display(){
   PImage openButton = loadImage("open.png");
   image(openButton, this.x, this.y);
 }
 
 void keyDetect(){
  if(keyPressed){
    if(key == 'z'){
    door.lx = -100;
    door.rx = 520;
    pressed = true;
    close.pressed = false;
     }
   }
 }
  
}
