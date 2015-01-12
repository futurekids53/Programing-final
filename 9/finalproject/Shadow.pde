class Shadow{
    int x;
    int y;
    int l;
    int h;
    int showUp = int( random(0,2) ) ;
    float showSpeed = 1.1;
    
    Shadow(int sX, int sY , int sL , int sH){
      this.x = sX;
      this.y = sY;
      this.l = sL;
      this.h = sH;
}



void show(){
    if( l  <= 280 ){
    PImage shadow = loadImage("shadow.png");
    image(shadow, this.x, this.y,this.l,this.h);
    x *= 0.95;
    y *= 0.95;
    
    l *= showSpeed;
    h *= showSpeed;
    
    }
   
   }
}



