import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

int cookieCount = 120;
Cookie [] cookie = new Cookie [cookieCount];
Special disco = new Special();
int santaSize = 25;
int point = 0;
Snow s = new Snow();
Gift g = new Gift();
ChristmasTree tree = new ChristmasTree();
int stopPoint;
int stopSize;
int snowScore;
int giftScore;
int discoCount;
int giftFrame;
int discoFrame;
float frame;
Minim minim ;
AudioPlayer [] backGround = new AudioPlayer[2];
//Game Status
final int GAME_START   =0;
final int GAME_PLAYING =1;
final int GAME_LOSE    =2;
int status;

PImage christmasTree, gift, santaClaus, snow, gameStartPage, gameOverPage;

void setup() {
  size(1280,960);
  frameRate(30);
  textFont(createFont("font/Michv2.ttf", 20));
  christmasTree=loadImage("data/christmastree2.png");
  gift=loadImage("data/gift.png");
  santaClaus=loadImage("data/santaClaus.png");
  snow=loadImage("data/snow.png");
  gameStartPage=loadImage("data/gameStartPage.png");
  gameOverPage=loadImage("data/gameOverPage.png");
  //point=0;
  status=GAME_START;
  reset();
   minim = new Minim(this);
   backGround[0] = minim.loadFile("data/background.mp3");
   backGround[1] = minim.loadFile("data/disco.mp3");
}

void draw(){
  background(26,134,33);
  noStroke();
  imageMode(CENTER);
  
  switch(status){
  case GAME_START:
    image(gameStartPage,width/2, height/2, width, height);
    backGround[0].pause();
    backGround[1].pause();
    break;

  case GAME_PLAYING:
    background(26,134,33);
    image(santaClaus,mouseX,mouseY,santaSize,santaSize/4*5);
    backGround[0].play();
    //snow for Demo
    if(point == 2 || point % 40 == 0){
    snowScore = point;
    }
    if(snowScore == 2 || snowScore%40==0 && snowScore!=0){
      s.display();
      s.move();
      s.checkEdge();
    }
     //frame count
     frame = frameCount/30;
     snowDetect();
     //rerun after snow stop
    if(frame >= stopPoint+3 && stopPoint!=0 ){
       for(int i = 0;i<cookieCount;i++){ 
      cookie[i].xSpeed = random(-2,2);
      cookie[i].ySpeed = random(-2,2);
      cookie[i].c=color(random(255),random(255),random(255));
      stopPoint = 0; 
     }
    }
    // gift for Demo
    if(point == 2 || point%25 == 0){
    giftScore = point;
    }
    if(giftScore==2 || giftScore%25==0 && giftScore!=0 ){
      g.display();
      g.move();
      g.checkEdge();
      giftDetect();
    }
     
    //cookie display
    for(int i = 0;i<cookieCount;i++){
      cookie[i].display();
      cookie[i].move();
      cookie[i].checkEdge();
    }
    //special display
      disco.display();
      disco.move();
      disco.checkEdge();
    if(discoCount%5==0 &&  discoCount!=0){
     backGround[0].pause();
     backGround[1].play();
    for(int i = 0; i<cookieCount;i++){
    cookie[i].c=color(random(255),random(255),random(255));
    }
    }else if(discoCount%5!=0){
    backGround[1].pause();
    }
    
    check();
    fill(0);
    textSize(20);
    text(discoCount,mouseX,mouseY);
    //drawLife();
    //drawScore();
    break;

  case GAME_LOSE:
    image(gameOverPage,width/2, height/2, width, height);
    printText();
    backGround[0].pause();
     backGround[1].pause();
    break;
}
}



void check(){
  for(int i = 0;i<cookieCount;i++){
    if(    cookie[i].x+cookie[i].size/2>= mouseX-santaSize/2 
        && cookie[i].x-cookie[i].size/2<= mouseX+santaSize/2 
        && cookie[i].y+cookie[i].size/2>= mouseY-santaSize/2 
        && cookie[i].y-cookie[i].size/2<= mouseY+santaSize/2){
      if(stopPoint!=0 && stopPoint >= frame -3){
      if(cookie[i].size<stopSize){
        cookie[i].disappear();
        santaSize+=1;
      }
      }else if(cookie[i].size<santaSize){
        cookie[i].disappear();
        santaSize+=1;
       }else if (cookie[i].size>santaSize){
        status = GAME_LOSE; 
       }
    }
  }
    if(    disco.x+disco.size/2>= mouseX-santaSize/2 
        && disco.x-disco.size/2<= mouseX+santaSize/2 
        && disco.y+disco.size/2>= mouseY-santaSize/2 
        && disco.y-disco.size/2<= mouseY+santaSize/2){
          discoCount+=1;
          disco.disappear();
        }
}


void treeDetect(){
  for(int i=0;i<cookieCount;i++){
    if(mouseX+tree.size/2>= cookie[i].x-cookie[i].size/2
      && mouseX-tree.size/2<= cookie[i].x+cookie[i].size/2
       && mouseY+tree.size/2>= cookie[i].y-cookie[i].size/2
      &&  mouseY-tree.size/2<= cookie[i].y+cookie[i].size/2){
        cookie[i].disappear();
       }
  }
}
void giftDetect(){
  if(   g.x+g.size/2>= mouseX-santaSize/2 
        && g.x-g.size/2<= mouseX+santaSize/2 
        && g.y+g.size/2>= mouseY-santaSize/2 
        && g.y-g.size/2<= mouseY+santaSize/2){
          giftFrame = int(frame);
          if(giftFrame >= frame-1){
            fill(255,0,0); 
            ellipse(g.x,g.y,santaSize+200,santaSize+200);
          }
       for(int i=0;i<cookieCount;i++){
         if(cookie[i].x < mouseX+santaSize+200&& 
            cookie[i].x > mouseX-santaSize-200  && 
            cookie[i].y < mouseY+santaSize+200  && 
            cookie[i].y > mouseY-santaSize-200   ){
             g.disappear();
             cookie[i].disappear();
             giftScore = 0;
            }
       
       }
}
}
void snowDetect(){
  if(   s.x+s.size/2>= mouseX-santaSize/2 
        && s.x-s.size/2<= mouseX+santaSize/2 
        && s.y+s.size/2>= mouseY-santaSize/2 
        && s.y-s.size/2<= mouseY+santaSize/2){
        stopPoint = int(frame);
        stopSize = santaSize +1000;
        s.disappear();
        snowScore =0;
       for(int i=0;i<cookieCount;i++){
       cookie[i].xSpeed = 0;
       cookie[i].ySpeed = 0;
       cookie[i].c=color(255);
       }
}
}
void mousePressed(){
  if (status == GAME_START){
    status = GAME_PLAYING;
  }else if(status == GAME_LOSE){
    reset();
    status = GAME_PLAYING;
    
  }
    if(status == GAME_PLAYING && mouseButton == RIGHT && discoCount>=3){
    discoCount-=3;
     tree.display(); 
      treeDetect();
}
  }
void mouseClicked(){

}
void reset(){
  for(int i=0;i<cookieCount;i++){
    //cookie[i] = null;
    cookie[i] = new Cookie();
  }
    disco = new Special();
  s = new Snow();
  santaSize = 25;
  point=0;
  stopPoint=0;
  discoCount=0;
  snowScore=0;
  giftScore=0;
  frame = 0;
  giftFrame=0;
  discoFrame=0;
Snow s = new Snow();
Gift g = new Gift();
ChristmasTree tree = new ChristmasTree();
  
}

void printText(){
  fill(0);
  textAlign(CENTER);
  if(status == GAME_LOSE){
    textSize(width/16);
    text("Score:" + point, width/3, height*3/5); 
  }
}

