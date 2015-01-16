import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;

PImage img;
PImage restart;

// game state
final int GAME_START = 1;
final int GAME_RUN = 2;
final int GAME_PAUSE = 3;
final int GAME_RESTART = 4;
int gameState;
Brick [] Bricks = new Brick [42] ;
KeyBoard [] KeyBoards = new KeyBoard[8] ;
int clickingNote;

int score=0;

void setup() {
  gameState=GAME_START;
  minim = new Minim(this);
  size(640, 480);
  background(0);
  frameRate(15);
  img=loadImage("data/bg.PNG");
  image(img, 0, 0); 
  //restart=loadImage("restart.png");
  KeyBoards[0]= new KeyBoard(1, "data/mReUp.wav");
  KeyBoards[1]= new KeyBoard(2, "data/mFa.wav");
  KeyBoards[2]= new KeyBoard(3, "data/mSo.wav");
  KeyBoards[3]= new KeyBoard(4, "data/mSoUp.wav");
  KeyBoards[4]= new KeyBoard(5, "data/mLaUp.wav");
  KeyBoards[5]= new KeyBoard(6, "data/mDo2.wav");
  KeyBoards[6]= new KeyBoard(7, "data/mReUp2.wav");
  KeyBoards[7]= new KeyBoard(8, "data/mFa2.wav");

  int totalH= 0 ; 
  for (int i=0; i<appleSong.length; i++) {

    Bricks[i]=new Brick (appleSong[i][0], appleSong[i][1]);
    totalH += Bricks[i].h;
    Bricks[i].y =0-totalH - 20 ;
  }
}


void draw() {
  image(img, 0, 0);

  switch(gameState) {
  case GAME_START:

    textSize(30);
    textAlign(CENTER);
    text("Press ENTER to start", 320, 440);
    break;

  case GAME_RUN:
    textSize(32);
    fill(0, 102, 153, 204);
    text("score:"+score, 320, 40);
    for (int i=0; i<appleSong.length; i++) {
      Bricks[i].display();
      Bricks[i].move();
    }
    for (int i=0; i<8; i++) {
      KeyBoards[i].display();
    }
    if (clickingNote != 0 ) {
      KeyBoards[clickingNote-1].play();
      for (int i = 0; i < Bricks.length; i++) {
        if ( Bricks[i].y + Bricks[i].h  >width*2/3 && Bricks[i].note==clickingNote && Bricks[i].y + Bricks[i].h <height) {
          Bricks[i].y = 2000 ; 
          score+=10;
        }
      }
      clickingNote=0;
    }

    if (Bricks[Bricks.length-1].y>height) {

      gameState=GAME_RESTART;
    }


    break;

  case GAME_PAUSE:
    textSize(30);
    textAlign(CENTER);
    text("Press ENTER to resume", 320, 440);
    break;

  case GAME_RESTART:
    reset();
    restart=loadImage("data/restart.png");
    image(restart, 320, 40);
    textSize(30);
    fill(255);
    text("Press ENTER to restart", 320, 440);

    break;
  }
}



void removeBrick(Brick obj) {
  obj.gone = true;
  obj.x = 2000;
  obj.y = 2000;
}

void reset() {
  // gameState=GAME_START;
  score=0;
  textSize(32);
  fill(0, 102, 153, 204);
  text("score:"+score, 320, 40);
  minim = new Minim(this);
  size(640, 480);
  //background(0);
  //frameRate(15);
  img=loadImage("data/bg.PNG");
  image(img, 0, 0); 
  KeyBoards[0]= new KeyBoard(1, "data/mReUp.wav");
  KeyBoards[1]= new KeyBoard(2, "data/mFa.wav");
  KeyBoards[2]= new KeyBoard(3, "data/mSo.wav");
  KeyBoards[3]= new KeyBoard(4, "data/mSoUp.wav");
  KeyBoards[4]= new KeyBoard(5, "data/mLaUp.wav");
  KeyBoards[5]= new KeyBoard(6, "data/mDo2.wav");
  KeyBoards[6]= new KeyBoard(7, "data/mReUp2.wav");
  KeyBoards[7]= new KeyBoard(8, "data/mFa2.wav");

  int totalH= 0 ; 
  for (int i=0; i<appleSong.length; i++) {

    Bricks[i]=new Brick (appleSong[i][0], appleSong[i][1]);
    totalH += Bricks[i].h;
    Bricks[i].y =0-totalH - 20 ;
  }
}

void mousePressed() {
  //  int xSpacing=75;
  if (mouseButton==LEFT) {
    if (mouseY>width*2/3 && mouseY<height) {
      for (int i=0; i<KeyBoards.length; i++) {
        if (KeyBoards[i].x < mouseX && mouseX <KeyBoards[i].x + 50 ) {

          KeyBoards[i].click();
          clickingNote=KeyBoards[i].note;
        } else if (KeyBoards[i].x+50 < mouseX && mouseX <KeyBoards[i].x ) {
          KeyBoards[i].click();
        }
      }
    }
  }
}

void keyPressed() {
  if (key == ENTER) {
    switch(gameState) {
    case GAME_START:
      gameState = GAME_RUN;
      break;

    case GAME_PAUSE:
      gameState = GAME_RUN;
      break;

    case GAME_RUN:
      gameState = GAME_PAUSE;
      break;

    case GAME_RESTART:
      gameState = GAME_RUN;
      break;
    }
  }
  clickingNote = 0 ; 
  if (key == '1' ) clickingNote = 1 ; 
  if (key == '2' ) clickingNote = 2 ;
  if (key == '3' ) clickingNote = 3 ;
  if (key == '4' ) clickingNote = 4 ;
  if (key == '5' ) clickingNote = 5 ;
  if (key == '6' ) clickingNote = 6 ;
  if (key == '7' ) clickingNote = 7 ;
  if (key == '8' ) clickingNote = 8 ;
}

