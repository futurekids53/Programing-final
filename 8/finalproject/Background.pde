class Background{

  PImage background_play;

  float xSpeed;
  float thrustX;
  float decay;
  float bX;
  float bY;
  Background(){
    background_play = loadImage("data/new_background.png"); 
    xSpeed = 10;
    thrustX = 1.5;
    decay = .97;
    bX = 0;
    bY = 0;
  }
  
  void showBackground(){
     image(background_play,bX,bY,1280,480);
  }
  
  void background_move(){
    bX -= xSpeed;
    if(bX < width*(-1)){
      bX = 0;
    }
  }
/*  void background_move(){
      if (key == CODED) {
      switch(keyCode) {
      case LEFT:
        xSpeed += thrustX;
        break;
      case RIGHT:
        xSpeed -= thrustX;
        break;
      case UP:
      break;
      default:
        xSpeed *= decay;
      }
        x += xSpeed;
    }
  }*/
}
