class Fink {
  PImage fink= loadImage("data/fink.png");

  int fX;
  int fY;

Fink(int X,int Y) {
 fX=X;
 fY=Y;
  }

   void display() {
  image(fink,fX,fY);
    
   }
   
}


