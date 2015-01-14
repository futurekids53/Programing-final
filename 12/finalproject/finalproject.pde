import ddf.minim.*;


Minim minim;
AudioPlayer sound;
AudioPlayer fail;


Ur ur;
LeftFire leftfire;
RightFire rightfire;
TopFire topfire;
BottomFire bottomfire;
Circle circle;


final int GAME_START = 0;
final int GAME_PLAY = 1;
final int GAME_PAUSE = 2;
final int GAME_OVER = 3;

int score = 00;
int gameStatus;
boolean FireLeft = true;
float [] fireY = 
  new float[] {40,80,120,160,200,240,280,320
               ,360,400,440,480,520,560};
               


void setup(){
  size(400,600);
  ur = new Ur(width/2,height*1/3);
  leftfire = new LeftFire();
  rightfire = new RightFire();
  bottomfire = new BottomFire();
  topfire = new TopFire();
  circle = new Circle();
  gameStatus = 0;
  
//sound
  
  minim = new Minim(this);
  sound = minim.loadFile("data/pop.wav");
  fail = minim.loadFile("data/fail.wav");
 

}


void draw(){
  
  background(178,255,217);
  noStroke();
  fill(89,178,134);
  ellipseMode(CENTER);
  ellipse(width/2,height/2,300,300);
  
  
    
  
  switch(gameStatus){
    
    case GAME_START:

    //Text
    textSize(50);
    textAlign(CENTER);
    fill(55);
    text("TAP MOTH",width/2,height/2-5);
    textSize(20);
    textAlign(CENTER);
    fill(55);
    text("Avoid Fire",width/2,height/2+30);
    textSize(15);
    fill(55);
    text("Press ENTER to Start",width/2,height/2+55); 
    
    break;
    //
    case GAME_PLAY:
    
    //sound
    fail.cue(0);

    
    
    //score
    printScore();
    //moth
    circle.display();
    ur.display();
    ur.Move();
    //fire
    topfire.display();
    bottomfire.display();
    changeFire(); 

    for(float fire_Y : fireY){
      pushMatrix();
      if (FireLeft == true){
        translate(-360,fire_Y);
        leftfire.display();
      }else{
        translate(0,fire_Y);
        rightfire.display();
      }
      popMatrix();
      //detectBurn
      float leftD = dist(ur.posX, ur.posY, 0, fire_Y);
      float rightD = dist(ur.posX, ur.posY, width-ur.size, fire_Y);
      if (ur.posY <= 35 || ur.posY >= 560){
       gameStatus = GAME_OVER; 
      }
      if(leftD <= 25 && FireLeft == true){
        gameStatus = GAME_OVER;
      }
      if(rightD <= 25 && FireLeft == false){
        gameStatus = GAME_OVER;
      }
    }



    break;

    case GAME_PAUSE:
    //Text
    textSize(20);
    fill(55);
    textAlign(CENTER,CENTER);
    text("Press ENTER to continue", width/2, height/2-5); 
    break;

    case GAME_OVER:
    textSize(20);
    textAlign(CENTER);
    fill(55);
    text("Press ENTER to restart", width/2, height/2-35); 
    textSize(50);
    textAlign(CENTER);
    fill(55);
    text("Score:"+score, width/2, height/2+15);
    fail.play();

    
    break;
  }
}

void keyPressed(){
    if(gameStatus == GAME_PLAY && key == ' '){
      ur.flap();
    }
    statusCtrl();
}

void randomFire(){
  int fire = 0;
  for(int i = 0; i < fireY.length; i++){
   fire +=  40*(int(random(7)+1));
   fireY[i]= fire;
  }
}

void statusCtrl() {
  if (key == ENTER) {
    switch(gameStatus) {

    case GAME_START:
      gameStatus = GAME_PLAY;
      randomFire();
      break;
    case GAME_PLAY:
      gameStatus = GAME_PAUSE;
      break;
    case GAME_PAUSE:
      gameStatus = GAME_PLAY;
      break;
    case GAME_OVER:
      gameStatus = GAME_START;
      reset();
      break;
    }
  }
}

void changeFire(){
  if(ur.posX <= 0 || ur.posX >= width - ur.size){
    FireLeft = !FireLeft;
    randomFire();
    score++ ;
    sound.play();
    sound.cue(0);
  }
}

void printScore(){
    fill(55);
    textSize(180);
    textAlign(CENTER,CENTER);
    text(score, width/2, height/2-30);
}

void reset(){
  score = 0;
  ur.posX = width/2;
  ur.posY = height*1/3;
  ur.Xspeed = 4.5;
}
