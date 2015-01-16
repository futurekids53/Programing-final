class Player{
  PImage [] players_jump;
  PImage [] players_run;
  PImage players_hurt;
  int Height;
  boolean jump; 
  boolean run; 
  boolean hurt;
  int jump_currentPosition;
  int run_currentPosition;
  int pY;
  final int up = 0;
  final int down = 1;
  int jump_dir = up;
  Player(){
    players_jump = loadImages("jump_animation/student", ".png", 20);
    players_run = loadImages("run_animation/run",".png",10);
    players_hurt = loadImage("student_hurt.png");
    Height = 0;
    jump = false;
    run = true;
    hurt = false;
    jump_currentPosition = 0;
    run_currentPosition = 0;
  }
  
  void keyPressed(){
      if (key == CODED) {
      switch(keyCode) {
      case LEFT:
        break;
      case RIGHT:
        break;
      case UP:
        jump  = true;
        run = false;
      break;
      case DOWN:
        break;
      default:
        break;
      }
    }
  }
  void run(){
    if(run){
      pY = 370;
      image(players_run[run_currentPosition], -70, height-400,400,400);
      run_currentPosition += 1;
      if(run_currentPosition >= players_run.length){
        run_currentPosition = 0;
      }
    }
  }
  
  void jump(){
    
    if(run == false && hurt == false){
      image(players_jump[jump_currentPosition], 0, height-220,180,220);
    }
//println(Height);
    if(jump){
      if(Height < 20){
        switch(jump_dir){
          case up:
          y = y - 10;
          pY -= 12;
          Height ++;
          jump_currentPosition += 1;
          if(jump_currentPosition >= players_jump.length){
             jump_currentPosition = 0;
          }
          break;
          case down:
          y = y + 20;
          pY += 12;
          Height -=2;
          jump_currentPosition += 1;
          if(jump_currentPosition >= players_jump.length){
             jump_currentPosition = 0;
          }
          break;
          default:
          break;
        
      }
      if(Height >= 20){
          jump_dir = down;
          Height = 19;
        }
      if(Height <0 ){
          jump_dir = up;
          Height = 0;
          jump = false;
          run = true;
        }
      }
    }
  }
    
    void hurt(){
      image(players_hurt,0, height-220,180,220);
      run= false;
    }
}
