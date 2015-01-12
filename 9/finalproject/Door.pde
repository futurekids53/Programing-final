class Door{
  
  float lx;
  float ly;
  float rx;
  float ry;
  float doorSpeed = 0.5;
  float stopSpeed = 0;
  float addSpeed = 0.5;
  
  Door(float leftX, float leftY, float rightX, float rightY){
    this.lx = leftX;
    this.ly = leftY;
    this.rx = rightX;
    this.ry = rightY;
  }
  
  void display(){
    PImage leftDoor = loadImage("left_door.png");
    PImage rightDoor = loadImage("right_door.png");
    image(leftDoor, this.lx, this.ly);
    image(rightDoor, this.rx, this.ry);    
  }
  
  void move(){
    if(lx >= 100){
      doorSpeed = stopSpeed;
    }
    
    lx += doorSpeed;
    rx -= doorSpeed;
    
    if(close.pressed){
      doorSpeed = stopSpeed;
    }
    
    if(open.pressed){
      doorSpeed = addSpeed;
    }
    println(lx);
  }
  
}
