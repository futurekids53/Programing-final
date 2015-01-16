class Dog{
  float dX;
  float dY;
  PImage [] dog;
  int dpos;
  Dog(){
    dX = width;
    dY = height - 150;
    dog = loadImages("dog/dog", ".png", 8);
    dpos = 0;
  }
  
  void showDog(){
    image(dog[dpos],dX,dY,120,120);
    dpos+=1;
    if(dpos >= dog.length){
      dpos = 0;
    }
  }
  
  void moveDog(){
    dX -=20;
  }
}
  
