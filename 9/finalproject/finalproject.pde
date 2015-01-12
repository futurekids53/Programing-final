Close close;
Open open;
Door door;
Shadow shadow;
Girl girl;
Pro pro;

import ddf.minim.*;
Minim minim;
Minim hi;
Minim roar;
Minim flesh;
Minim scream;
AudioPlayer bgm;

int score = 0;
int life =3;
int counter = 0;
int correct = 0;
int time = 0;


PImage gameStart, gameStartNoWord, gameStartZong, gameStartYuan, gameStart1, gameStart3, gameStartF;
PImage gamePlay, gameWin, gameLose;
PImage leftDoor, rightDoor;
PImage lifeScoreBar, openButton, closeButton;
PImage floor1, floor2, floor3, floor4, floor5, floor6, floor7;
PImage floor8, floor9, floor10, floor11, floor12, floor13;

final int GAME_START = 0;
final int GAME_RUN =1;
final int GAME_WIN = 2;
final int GAME_LOSE =3;
int status;


void gameReset(){
  score = 0;
  life = 3;
  counter = 0;
  correct = 0;
}

void setup() {
  size(640, 480); 
  open = new Open(247, 425);
  close = new Close(350, 425);
  door = new Door(-100, 50, 520, 50);
  
  gamePlay = loadImage( "data/game_play_no_background_no_word.png" );
  lifeScoreBar= loadImage( "data/life_score_bar.png" );
  closeButton = loadImage( "data/close.png" );
  openButton = loadImage( "data/open.png" );
  leftDoor = loadImage( "data/left_door.png" );
  rightDoor = loadImage( "data/right_door.png" );
  gameStart = loadImage( "data/game_start.png" );

  gameWin = loadImage( "data/game_win.png" );
  gameLose = loadImage( "data/game_lose.png" );
  floor1 =  loadImage( "data/floor_1.png" );
  floor2 =  loadImage( "data/floor_2.png" );
  floor3 =  loadImage( "data/floor_3.png" );
  floor4 =  loadImage( "data/floor_4.png" );
  floor5 =  loadImage( "data/floor_5.png" );
  floor6 =  loadImage( "data/floor_6.png" );
  floor7 =  loadImage( "data/floor_7.png" );
  floor8 =  loadImage( "data/floor_8.png" );
  floor9 =  loadImage( "data/floor_9.png" );
  floor10 =  loadImage( "data/floor_10.png" );
  floor11 =  loadImage( "data/floor_11.png" );
  floor12 =  loadImage( "data/floor_12.png" );
  floor13 =  loadImage( "data/floor_13.png" );
  hi = new Minim(this);
  roar = new Minim(this);
  scream= new Minim(this);
  flesh= new Minim(this); 
  shadow = new Shadow(300 , 220 , 41, 50);
  girl = new Girl(170,80,41,50);
  pro = new Pro(170,80,41,50);
  
  minim = new Minim(this);
  bgm = minim.loadFile("data/BGM.mp3"); 
  bgm.play();    
  
  
}

void draw() {
  background(255);
  if (bgm.isPlaying () == false) {
    bgm.rewind();
    bgm.play();
  }
  
  switch(status) {

  case GAME_START:
    showPic();
    printText();
    break;
    
  case GAME_RUN:
    showFloor();
    door.display();
    door.move();
    open.keyDetect();
    close.keyDetect();
    open.display();
    close.display();
    
    
    
    doorReopen();
    showPic();
    drawLife();
    printText();
    
    girl.display();
    girl.delay();
    pro.display();
    pro.delay();
    shadow.show();
    break;

    case GAME_WIN:
    showPic();
    break;

    case GAME_LOSE:
    showPic();
    break;
  }


  
}

void doorReopen() {
  if (close.pressed) {
    counter +=1;
    if (counter == 30) {
      door.lx = -100;
      door.rx = 520;
      open.pressed = true;
      close.pressed = false;
      counter = 0;
    }
  }
}


void showPic() {
  switch(status) {
  case GAME_START:
    image(gameStart, 0, -1);
    break;

  case GAME_RUN:
    //game_play(0,-1)
    image(gamePlay, 0, -1);
    //life_score_bar(0,421)
    image(lifeScoreBar, 0, 421);
    //close(340,425)
    image(closeButton, 340, 425);
    //open(247,425)
    image(openButton, 247, 425);
    break;

  case GAME_LOSE:
    image(gameLose, 0, 0);
    break;

  case GAME_WIN:
    image(gameWin, 0, 0);
    break;
  }
}

void showFloor() {
  int floor= correct/3+1;
  if(floor ==1){  
  image(floor1, 100, 90);
  }
  if(floor ==2){
  image(floor2, 100,90);
  }
  if(floor ==3){
  image(floor3, 100,90);
  }
  if(floor ==4){
  image(floor4, 100,90);
  }
  if(floor ==5){
  image(floor5, 100,90);
  }
  if(floor ==6){
  image(floor6, 100,90);
  }
  if(floor ==7){
  image(floor7, 100,90);
  }
  if(floor ==8){
  image(floor8, 100,90);
  }
  if(floor ==9){
  image(floor9, 100,90);
  }
  if(floor ==10){
  image(floor10, 100,90);
  }
  if(floor ==11){
  image(floor11, 100,90);
  }
  if(floor ==12){
  image(floor12, 100,90);
  }
  if(floor ==13){
  image(floor13, 100,90);
}
  if(correct/3+1 >13){
    status= GAME_WIN;
  }
}

void drawLife() {
  int ox = 130;
  int oy = 450;
  int size = 30;
  int spacing = 40;
  for (int i=0; i<life; i++) {
    int x = ox + spacing*i;
    int y = oy;
    fill(255, 72, 21);
    noStroke();
    ellipse(x, y, size, size);
  }
  if (life == 0){
    status = GAME_LOSE;
  }
}

void doorReset(){
  shadow = new Shadow(170, 80, 41, 50);
  girl = new Girl(170,80,41,50);
  pro = new Pro(170,80,41,50);
  drawLife();
}



void printText(){
  switch(status) {
  case GAME_RUN:
    fill(209, 15, 18);
    textSize(30);
    text(score, 550, 460);
    
    fill(28,255,0);
    textSize(40);
    text(correct/3+1, 310,70);
    break;
  }
}


void statusCtrl() {
  if (key ==ENTER) {
    switch (status) {
    case GAME_START:
      status = GAME_RUN;
      break;

    case GAME_WIN:
      status = GAME_START;
      break;

    case GAME_LOSE:
      status = GAME_START;
      gameReset();
      doorReset();
      break;
    }
  }
}

void keyPressed() {
  statusCtrl();
}


