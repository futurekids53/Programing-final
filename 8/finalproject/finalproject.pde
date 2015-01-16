Background background;
Player player;
//Rewards reward;
Rewards [] rewardList;
Dog [] dogList;

import ddf.minim.*;

Minim minim;
AudioPlayer music_player;

//Game Status
final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_PAUSE   = 2;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;

float x =0;
float y =0;
int frame ;
int frameDog;
int rewardNum;
int dogNum;
int point;
int status;
int life;
int hurt_time;

boolean reward1;
boolean reward2;
boolean reward3;
boolean reward4;

PImage [] background_start;
PImage [] background_pause;
PImage [] background_win;
PImage [] background_lose;

void setup(){
  status = GAME_START;
  minim = new Minim(this);
  music_player = minim.loadFile("data/夏日印象 - Summer.mp3");
  
  size(640,480);
  
  background_start = loadImages("data/background/gamestart",".jpg",1);
  background_pause = loadImages("data/background/pause",".jpg",1);
  background_win = loadImages("data/background/win",".jpg",1);
  background_lose = loadImages("data/background/lose",".jpg",1);
  
  background = new Background();
  player = new Player();
  //reward = new Rewards();
  rewardList = new Rewards[30];
  dogList = new Dog[10];
  frameRate(30);
  
  reset();
}

void draw(){
  
  switch(status){
    
   case GAME_START:

    image(background_start[0],0,0,640,480);
    reset();
    break;
  case GAME_PLAYING:  

    
    background.showBackground();  
    background.background_move();
/*stroke(255);
  line(100,0,100,height);
  line(180,0,180,height);
  line(0,300,width,300);
  line(0,350,width,350);
  line(0,400,width,400);
  line(0,440,width,440);*/
    player.run();
    player.keyPressed();
    //player.keyReleased();
    pushMatrix();
    translate(0, y); 
    player.jump();
    popMatrix();
    rewardMaker(frame);
    drawReward();
    drawScore();
    frame++;
    frameDog++;
    getReward_detect();
    dogMaker(frame);
    drawDog();
    hitDog_detect();
    hurt();
    drawLife();
    drawTime();
    checkWinLose();

    break;
  case GAME_PAUSE:
    image(background_pause[0],0,0,640,480);
    break;  

  case GAME_WIN:
    image(background_win[0],0,0,640,480);
    break;  
    
  case GAME_LOSE:
    image(background_lose[0],0,0,640,480);
    break;  
          default:
          break;
  }
}

void drawTime() {
  noStroke();
  fill(95, 194, 226);
  textAlign(CENTER, CENTER);
  textSize(23);
  text("TIME:"+(60-frame/30), 50, 16);
}

void drawLife() {
  fill(230, 74, 96);
  text("LIFE:", 36, 455);
  for(int i = 0; i<life ; i++){
    ellipse(78+i*25,459,15,15);  
  }
}

void drawScore() {
  noStroke();
  fill(95, 194, 226);
  textAlign(CENTER, CENTER);
  textSize(23);
  text("SCORE:"+point, width/2, 16);
}

void rewardMaker(int frame){
  int rowNum = int(random(0,6));
  int rewardY= int(random(100,300));

switch(rowNum){
  case 1:
    if(frame%40 == 0){
      rewardList[rewardNum] = new Rewards(width,rewardY);
    }
    break;
  case 2:
    if(frame%40 == 0){
      rewardList[rewardNum] = new Rewards(width,rewardY);
      rewardList[rewardNum+1] = new Rewards(width+100,rewardY);
    }
    break;
  case 3:
    if(frame%40 == 0){
      rewardList[rewardNum] = new Rewards(width,rewardY);
      rewardList[rewardNum+1] = new Rewards(width+100,rewardY);
      rewardList[rewardNum+2] = new Rewards(width+200,rewardY);
    }
    break;  
  case 4:
    if(frame%45 == 0){
      rewardList[rewardNum] = new Rewards(width,rewardY);
      rewardList[rewardNum+1] = new Rewards(width+100,rewardY);
      rewardList[rewardNum+2] = new Rewards(width+200,rewardY);
      rewardList[rewardNum+3] = new Rewards(width+300,rewardY);
    }
    break;  
  case 5:
    if(frame%50 == 0){
      rewardList[rewardNum] = new Rewards(width,rewardY);
      rewardList[rewardNum+1] = new Rewards(width+100,rewardY);
      rewardList[rewardNum+2] = new Rewards(width+200,rewardY);
      rewardList[rewardNum+3] = new Rewards(width+300,rewardY);
      rewardList[rewardNum+4] = new Rewards(width+400,rewardY);
    }
    break;  
  case 6:
    if(frame%55 == 0){
      rewardList[rewardNum] = new Rewards(width,rewardY);
      rewardList[rewardNum+1] = new Rewards(width+100,rewardY);
      rewardList[rewardNum+2] = new Rewards(width+200,rewardY);
      rewardList[rewardNum+3] = new Rewards(width+300,rewardY);
      rewardList[rewardNum+4] = new Rewards(width+400,rewardY);
      rewardList[rewardNum+5] = new Rewards(width+500,rewardY);
    }
    break; 
          default:
          break;
}

  if (rewardNum<rewardList.length-1){
    rewardNum+=1;
  } else {
    rewardNum = 0;
  }
  
}

void drawReward(){
    for(int i = 0;i<rewardList.length-1;i++){
      Rewards reward = rewardList[i];
      if (reward!=null){
        reward.showReward();
        reward.moveReward();
      }
    }
}

void getReward_detect(){
  for(int i = 0 ; i<rewardList.length;i++){
    Rewards reward = rewardList[i];
    if(reward!=null){
      if(player.run == true){
        if(reward.rX <180 && 240 < reward.rY && reward.rY < 440){
          reward.rY = 1000;
          point+=10;
          if(point >= 100){
            //println(point);
            if(reward1){
              life++;
              //println("1");
            }
            reward1 = false;
            
          }
          if(point >= 200){
            //println(point);
            if(reward2){
              life++;
              //println("2");
            }
            reward2 = false;
            
          }
          if(point >= 300){
            //println(point);
            if(reward3){
              life++;
              //println("3");
            }
            reward3 = false;
            
          }
          if(point >= 400){
            //println(point);
            if(reward4){
              life++;
              //println("4");
            }
            reward4 = false;
            
          }
        }
      }
      if(player.jump == true){
        if(30 < reward.rX && reward.rX <180 && player.pY-70 < reward.rY && reward.rY < player.pY+70){
          reward.rY = 1000;
          point+=10;
          if(point >= 100){
            //println(point);
            if(reward1){
              life++;
              //println("1");
            }
            reward1 = false;
            
          }
          if(point >= 200){
            //println(point);
            if(reward2){
              life++;
              //println("2");
            }
            reward2 = false;
            
          }
          if(point >= 300){
            //println(point);
            if(reward3){
              life++;
              //println("3");
            }
            reward3 = false;
            
          }
          if(point >= 400){
            //println(point);
            if(reward4){
              life++;
              //println("4");
            }
            reward4 = false;
          }
        }
      }
    }
  }
}

void dogMaker(int frameDog){
  int frequency = int(random(80,160));
    if(frameDog%frequency == 10){
      dogList[dogNum] = new Dog();
      if (dogNum<dogList.length-1){
        dogNum+=1;
      } else {
        dogNum = 0;
      }      
    }

}

void drawDog(){

    for(int i = 0;i<dogList.length;i++){
      Dog doggy = dogList[i];
      //println(doggy);
      if (doggy!=null){
        doggy.showDog();
        doggy.moveDog();
      }
    }
}

void hitDog_detect(){
  for(int i = 0 ; i<dogList.length;i++){
    Dog dog = dogList[i];
    if(dog!=null){
      if(player.run == true){
        if(1.0 < dog.dX && dog.dX <180 && 240 < dog.dY && dog.dY < 440){
        dog.dY = 1000;
        player.hurt = true;
        life--;
        }
      }
      /*if(player.jump == true){
        if(30 < reward.rX && reward.rX <180 && player.pY-70 < reward.rY && reward.rY < player.pY+70){
          reward.rY = 1000;
          point+=10;
        }
      }*/
    }
  }
}

void hurt(){

  if(player.hurt){
    player.hurt();
    hurt_time++;
  }
  if(hurt_time>15){
    player.hurt = false;
    player.run = true;
    hurt_time = 0;
  }

}
void checkWinLose(){
  if(60-frame/30 == 0){
    status = GAME_LOSE;
  }
  if(life == 0){
    status = GAME_LOSE;
  }
  if(point >500){
    status = GAME_WIN;
  }
}

void reset() {
  for (int i=0; i<rewardList.length-1; i++) {
    rewardList[i] = null;
  }
  
  point = 0;
  frame = 0;
  frameDog = 0;
  rewardNum = 0;
  dogNum = 0;
  life = 3;
  hurt_time = 0;
  player.hurt = false;
  player.run = true;
  player.jump = false;
  reward1 = true;
  reward2 = true;
  reward3 = true;
  reward4 = true;
  music_player.play();
  
}

void keyPressed() {
  statusCtrl();
}

void statusCtrl() {
  if (key == ENTER) {
    switch(status) {
/*-----------add things here--------*/
    case GAME_START:
      status = GAME_PLAYING;
      break;
    
    case GAME_PLAYING:
      status = GAME_PAUSE;
      break;
      
    case GAME_PAUSE:
      status = GAME_PLAYING;
      break;
      
    case GAME_WIN:
      reset();
      status = GAME_PLAYING;
      break;      
 
    case GAME_LOSE:
      reset();
      status = GAME_PLAYING;
      break;
          default:
          break;      
    }
  }
}

