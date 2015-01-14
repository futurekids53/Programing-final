

class Ur {
  float Xspeed = 4.5;
  float gravity = 0.3 ;
  float Yspeed = 1;
  float posX;
  float posY;
  float size = 50;




  
  PImage img;

  Ur(float x, float y) {
    this.posX = x;
    this.posY = y;
    img = loadImage("data/ur.png");
    
      
  } 

  void display() {
    imageMode(CORNER);
    image(img, posX, posY, size, size);
  }
  
  void Move(){
    posX -= Xspeed;
    posY += Yspeed;
    Yspeed += gravity;
    if(Yspeed >= 10){
      Yspeed = 10;
    }
    
    if(posX <= 0 || posX >= width - size){
      Xspeed *= -1.05;
      Yspeed *= 0.85;

    }
    
    if(posY <= 0){
      posY = 0;
      Yspeed *= -0.5;
    }
  }

  void flap(){
    Yspeed = -7.5;
  }   
}

