PImage playbk,pause,start,win,lose;

//MinimInput
import ddf.minim.*;
Minim minim;
AudioInput startin;
AudioInput accessMic;
AudioPlayer bgMusic;
AudioPlayer jupShiro;
AudioPlayer fishAtk;
AudioPlayer jupSound;

//State
final int GAME_START   = 0;
final int GAME_READY   = 1;
final int GAME_PLAY    = 2;
final int GAME_PAUSE   = 3;
final int GAME_WIN     = 4;
final int GAME_LOSE    = 5;
int status;
//rope variables
int ropNum;
float rPosiX;
float rPosiY;
float rLength;
float nowR=0;
int rno [];
int fno [];
int score =0;
boolean kill=false ;//if jump on shiro = true ;
float wX = 5050 ;
float vol =0;
//Class
Mau player;
Monster[] mon;
Monster[] fish;
Rope[] rList;
Bubble [] bub;
void setup(){
  size(800, 500, P3D);
  playbk = loadImage("data/playbk.jpg");
  start = loadImage("data/start.png");
  pause = loadImage("data/pause.png");
  win = loadImage("data/gamewin.png");
  lose = loadImage("data/gameover.png");
 //-------music------// 
  minim = new Minim(this);
  startin = minim.getLineIn();
  bgMusic = minim.loadFile("data/Good Starts.mp3");
  fishAtk = minim.loadFile("data/attack02.wav");
  jupSound = minim.loadFile("data/jump01.wav");
 // jupShiro = minim.loadFile("attack02.wav");
  bgMusic.play();
  bgMusic.loop();//replay bg music ;
  //
  player = new Mau();  
  mon = new Monster[30];
  fish = new Monster[200];
  rList = new Rope[100];
  bub = new Bubble[20];//same as fno
  rno = new int [30];
  fno = new int [20];
  makeRope();
  makeMonst();
  makeFish();  
  chooseAtkFish();
  makeBub() ;
  status = GAME_START;
}

void reset(){  
  player.positY = 275 ;
  player.x = 50;
  player.y = 200; 
  nowR=0 ;
  vol =0 ;
  score =0;
  wX = 5050 ;
  for (int i=0; i<rList.length-1; i++) {
    rList[i] = null;
  }
  for (int i=0; i<mon.length-1; i++) {
    mon[i] = null;
 // rno[i] = null;
  }
  for (int i=0; i<fish.length-1; i++) {
    fish[i] = null;
  }
  for (int i=0; i<bub.length-1; i++) {
    bub[i] = null;
  //  fno[i] = null;
  }  
  makeRope();
  makeMonst();
  makeFish();  
  chooseAtkFish();
  makeBub() ;
  status = GAME_START;
}

void draw(){   
  gameState(); 
  checkSound();
}
//------Sound------//
void checkSound(){//BUG !!!!why Q^Q BUG NullPointerException Q^Q
  /*if(kill){
    jupShiro.rewind();
    jupShiro.play();
    println("kill!");
    kill =false ;
  }*/
  if(fish[fno[1]].atk){
    fishAtk.rewind();
    fishAtk.setVolume(0.5);//**noisy XD//
    fishAtk.play();
   // println("atk");
  }
 

}
//----------------Monster-----------------//
void makeMonst(){
    for(int j=0;j<mon.length;j++){
       rno[j] = int(random(100));
       if(rno[j]==0){
       j--;
       }else{
       mon[j] = new Monster(1,rList[rno[j]].rX,rList[rno[j]].rY);
       }
    }
}

void makeFish(){
  for(int k=0;k<fish.length;k++){
    fish[k] = new Monster(0,k*78,height-95);
  }
}

void drawMonst(){
  for(int j=0;j<mon.length;j++){
    mon[j].display(rList[rno[j]].rX,rList[rno[j]].ropL);
    mon[j].move();
  }
}

void drawFish(){
  for(int k=0;k<fish.length;k++){
    fish[k].display(1,2);
    fish[k].move();
  }
}
void chooseAtkFish(){  
  for(int k=0;k<fno.length;k++){//choose attack fish
    fno[k] = int(random(fish.length));
  }
}
void fishAtk(){
  for(int k=0;k<fno.length;k++){   
    fish[fno[k]].fishAtck();
  //  bub[k] = new Bubble(fish[fno[k]].fX+10,fish[fno[k]].fY);
  }
}
void makeBub(){
  for(int k=0;k<fno.length;k++){   
    bub[k] = new Bubble(fish[fno[k]].fX+35,fish[fno[k]].fY);
  }
}
void bubMove(){  
  for(int k=0;k<bub.length;k++){
    bub[k].bX-=2 ;
    if(bub[k].bX < player.x +150 ){
      bub[k].display();
      bub[k].ascend();   
    }
  }
}
void removeMon(int i){
  mon[i].mY = height +200 ;
}


//------------------Rope------------------//
void makeRope(){
   rList[0] = new Rope(4,20,250);
   nowR+=270;
  for(int i=1; i<100 ;i++){
    int ropeNo = int(random(5));
    int range = 250 + 50*(int(random(-2,2)));
    float rangeCheck = range - rList[i-1].rY;
    if(rangeCheck > 50){
      i--;
    }else{
      rList[i] = new Rope(ropeNo,nowR,range);
    switch(ropeNo){
      case 0:
      rLength = 100 ;
      nowR+=100;
      break;
      case 1:
      rLength = 110 ;
      nowR+=110;
      break;
      case 2:
      rLength = 150 ;
      nowR+=150;
      break;
      case 3:
      rLength = 200 ;
      nowR+=200;
      break;
      case 4:
      rLength = 270 ;
      nowR+=270;
      break;      
    }
    }
    
   // println(nowR);
  }
}
void drawRope(){
 for(int i=0; i<100 ;i++){
    Rope rope = rList[i];
    rope.move();
    rope.display();   
  }
}
  
void stepOnRope(){//check rope hit x=0,delete and make new rope ;
  
  for(int i=0;i<100;i++){
    switch(rList[i].ropeNum){
      case 0:
      rLength = 100 ;      
      break;
      case 1:
      rLength = 110 ;
      break;
      case 2:
      rLength = 150 ;      
      break;
      case 3:
      rLength = 200 ;      
      break;
      case 4:
      rLength = 270 ;
      break;      
    }
   // println(rLength);
   if(player.x+42 > rList[i].rX && player.x<(rList[i].rX+rLength)){//&& player.ySpeed >0   
    player.positY = rList[i].rY-25 ;
    if(player.ySpeed == 0 && player.y <= player.positY){
    player.y += 2.7 ;
    }else if(player.y > rList[i].rY){
    player.positY = height-100 ;
    player.y += 2.7 ;
    }
     break;
    }  
  }
}
//shiro jumping and check touching Shiro
void jumpShiro(){
  for(int j=0;j<mon.length;j++){
    if( ((player.y+37)-mon[j].mY > 0 )&& player.ySpeed>0 && (  ((player.x +40-mon[j].mX )>0 &&(player.x< mon[j].mX)) || ((mon[j].mX < player.x )&&(player.x < mon[j].mX+50 ))  )){
    //if(player.y + 26 <= mon[j].mY && (player.x > mon[j].mX && player.x < mon[j].mX+ 50)){/*orin*///&&player.ySpeed>0
      //println(j);
      player.jump = true;
      player.onceJump = 0;
      kill=true ;//purpose for music, but there are some bugs exist = =""
      removeMon(j);
      score+=20 ;
     
    //  println("kill",j);/**/
      }
      if( ((player.y+37)-mon[j].mY > 0 )&& (  ((player.x +40-mon[j].mX )>0 &&(player.x< mon[j].mX)) || ((mon[j].mX < player.x )&&(player.x < mon[j].mX+50 ))  )){
        status = GAME_LOSE ;
        //println("die",j);
      }
    }
  }



//-------------------Game---------------------//
void checkDie(){
  if(player.y > height -50){
    status = GAME_LOSE ;
  }
  for(int i=0;i<bub.length;i++){
   // if( (bub[i].bX+ bub[i].diameter > player.x) && (bub[i].bX -bub[i].diameter < player.x) &&(bub[i].bY + bub[i].diameter > player.y+40) && (bub[i].bY-bub[i].diameter < player.y+37) ){
    if( (abs(bub[i].bX-player.x)< 25) &&(abs(bub[i].bY - player.y) < 25) ){ 
     status = GAME_LOSE ;/**/
    //  println("touchBub"+i);
    }
  }
}
void drawDis(){
  textSize(50);
  fill(255, 250, 250, 70);
  text(wX - player.x , 150, 60);
}
void gameState(){
  switch(status) {
     case GAME_START:
     image(start,0,0);
     break;
     case GAME_READY:
     image(playbk,0,0);
     player.goRight =false;
     player.move();
     textSize(40);
     textAlign(CENTER);
     fill(0,144,180);
     text("Are You READY?",width/2,height/2);
     //getVol();
    // makeRope();
     break;
     case GAME_PLAY:
    // image(playbk,0,0);
     player.goRight =true;
     player.move();
     player.x-=2 ;//this one
     player.display();
     drawRope();
     drawMonst();
     stepOnRope();
     drawFish();
     fishAtk();
     bubMove();
     checkJump();
     checkDie();
     jumpShiro();
     drawDis();
     checkWin();
     textSize(40);
     fill(255,239,213,70);
     text("SCORE:"+score,width-100,50);
     break;
     case GAME_PAUSE:
     image(pause,0,0);
     break;
     case GAME_WIN:     
     image(win,0,0,width,height);
     textSize(30);
     textAlign(LEFT);
     fill(255,239,213,150);
     text("FINAL SCORE:"+score,width-500,height-50);
     text("Distance Completed:5000",width-500,height-20);
      break;
     case GAME_LOSE:     
     image(lose,0,0,width,height);
     textSize(30);
     textAlign(LEFT);
     fill(255,239,213,234);
     text("FINAL SCORE:"+score,width-500,height-50);
     text("Distance Completed:"+(5000-wX-player.x),width-500,height-20);
     break;
  }
}
////
void getVol(){
   float max =0 ;
   accessMic = minim.getLineIn();
   vol = accessMic.getGain();
   for(int i = 0; i < startin.bufferSize() - 1; i++){
  // vol = in.mix.get(i)*50 ;  
   if(vol > max){
     max = vol ;
    } 
   println(max,vol);   
   }
}
void checkJump(){
  for(int i = 0; i < startin.bufferSize() - 1; i++){
    line( i, 50 + startin.left.get(i)*50, i+1, 50 + startin.left.get(i+1)*50 );
    line( i, 150 + startin.right.get(i)*50, i+1, 150 + startin.right.get(i+1)*50);
     if(startin.mix.get(i)*50 > 45 ){
       if(player.ySpeed==0){
    //   println(in.left.get(i)*50) ;
       player.jump =true;
       jupSound.rewind();
       jupSound.play();
       }
     }
  }
}
void checkWin(){ 
  //strokeWeight(10);
  //line(wX,0,wX,height);
  wX-=2 ;
  if(player.x > wX){
    status = GAME_WIN ;
  }
}
/*
void keyPressed(){
  statusCtrl();
}*/
////
void statusCtrl(){
  if (key == ENTER){
    switch(status){
    case GAME_START:
      status = GAME_READY;
    break;
    case GAME_READY:
      status = GAME_PLAY;
    break;
    case GAME_PAUSE:
      status= GAME_PLAY;
    break;
    case GAME_PLAY:
      status= GAME_PAUSE;
    case GAME_WIN:
      reset();
      status= GAME_READY;
    break;
    case GAME_LOSE:
      reset();
      status= GAME_READY;
    break;
    }
  }
}


void keyPressed(){
  statusCtrl();
  if (keyCode==UP && player.ySpeed == 0) {
        player.jump = true;
        jupSound.rewind();
        jupSound.play();
      }
}
