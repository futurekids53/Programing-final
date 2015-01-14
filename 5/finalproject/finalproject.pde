import ddf.minim.*;

Player player;
SlotMachine machine;
Chance chance;
Destiny destiny;
Timer timer;
Question question;
Minim minim;
AudioPlayer song;
AudioSample wow;
AudioSample ohoh;
AudioSample ohyeah;
AudioSample cry;
AudioSample baba;
PFont myFont;
PImage map_1;
PImage map_2;
PImage map_3;
PImage map_load;
PImage game_start;
PImage game_win;
PImage game_lose;
PImage game_rule;

final int GAME_START = 0;
final int GAME_MAP_1 = 1;
final int GAME_MAP_2 = 2;
final int GAME_MAP_LOAD = 3;
final int GAME_MAP_3 = 4;
final int GAME_CHANCE = 5;
final int GAME_DESTINY = 6;
final int GAME_QUIZ = 7;
final int GAME_WIN = 8;
final int GAME_LOSE = 9;
final int CHANCE_WINDOW = 10;
final int DESTINY_WINDOW = 11;
final int QUIZ_WINDOW = 12;
final int MOVE_WINDOW = 13;
final int GAME_RULE = 14;
final int WIN_WINDOW = 19;

int status;
boolean rolling = false;
boolean button = false;
int x = 753;
int y = 400;
int w = 150;
int h = 50;
int currentTime = 0;
int window;
int moveDistance;
int count;
boolean isRepeating = true; 
boolean soundPlay = true;

void setup() {
  myFont = createFont("微軟正黑體",20);
  textFont(myFont);
  count = 301;
  status = GAME_START;
  size(1000, 480);
  background(50, 50, 50);
  rectMode(CENTER);
  map_1 = loadImage("data/map_1.png");
  map_2 = loadImage("data/map_2.png");
  map_3 = loadImage("data/map_3.png");
  map_load = loadImage("data/map_load.png");
  game_lose = loadImage("data/game_lose.png");
  game_start = loadImage("data/game_start.png");
  game_win = loadImage("data/game_win.png");
  game_rule = loadImage("data/game_rule.png");
  player = new Player(-2, 186);
  machine = new SlotMachine();
  chance = new Chance();
  destiny = new Destiny();
  timer = new Timer(1000);
  question = new Question(100, 50, 100, 150, 200, 250, 100);
  minim = new Minim(this);
  song = minim.loadFile("data/map_song.mp3");
  wow = minim.loadFile("data/wow.mp3");
  ohoh = minim.loadFile("data/ohoh.mp3");
  ohyeah = minim.loadFile("data/ohyeah.mp3");
  cry = minim.loadFile("data/cry.mp3");
  baba = minim.loadFile("data/baba.mp3");
  reset();
  
  
}

void draw() {
  switch(status) {
    
    case GAME_START:
    image(game_start, 0, 0);
    song.play();
    break;
    
    case GAME_RULE:
    image(game_rule, 0, 0);
    break;
    
    case CHANCE_WINDOW:
    if(millis()-currentTime >= 1000){
    status = GAME_CHANCE;
    }
    break;
    
    case DESTINY_WINDOW:
    if(millis()-currentTime >= 1000){
    status = GAME_DESTINY;
    }
    break;
    
    case QUIZ_WINDOW:
    if(millis()-currentTime >= 1000){
    status = GAME_QUIZ;
    }
    break;
    
    case MOVE_WINDOW:
    if(millis()-currentTime >= 1000){
    checkMoveDistance();
    checkWindow();
    }
    break;
    
    case WIN_WINDOW:
    if(millis()-currentTime >= 1000){
    status = GAME_WIN;
    }
    break;
    
    case GAME_MAP_1:
    image(map_1, 0, 0);
    player.display();
    statusCtrl_map_1();
    rolling();
    nextMap();
    showTimer();
    break;
    
    case GAME_MAP_2:
    image(map_2, 0, 0);
    player.display();
    statusCtrl_map_2();
    rolling();
    nextMap();
    showTimer();
    break;
    
    case GAME_MAP_LOAD:
    image(map_load, 0, 0);
    if(soundPlay) {
      baba.trigger();
      soundPlay = false;
    }
    if(millis()-currentTime >= 2000){
    status = GAME_MAP_3;
    soundPlay = true;
    player.posX = player.posX - width + 10;
    }
    showTimer();
    break;
    
    case GAME_MAP_3:
    image(map_3, 0, 0);
    player.display();
    statusCtrl_map_3();
    rolling();
    showTimer();
    break;
    
    case GAME_CHANCE:
    chance.display();
    if(soundPlay) {
      wow.trigger();
      soundPlay = false;
    }
    showTimer();
    break;
    
    case GAME_DESTINY:
    destiny.display();
    if(soundPlay) {
      ohoh.trigger();
      soundPlay = false;
    }
    showTimer();
    break;
    
    case GAME_QUIZ:
    background(50, 50, 50);
    question.statusCtrl();
    showTimer();
    break;
    
    case GAME_WIN:
    image(game_win, 0, 0);
    if(soundPlay) {
      ohyeah.trigger();
      soundPlay = false;
    }
    break;
    
    case GAME_LOSE:
    image(game_lose, 0, 0);
    if(soundPlay) {
      cry.trigger();
      soundPlay = false;
    }
    break;
  }
  if(isRepeating == true) { 
    if(song.isPlaying()==false) { 
      song.rewind(); 
      song.play(); }
  }
}

void showTimer() {
  if (timer.isFinished()) {
    count--;
    timer.start();
  }
  textSize(30);
  fill(0, 0 ,0);
  text("Time :"+count,40,50);
  if (count < 0) {
    status = GAME_LOSE;
  }
}

void rolling() {
  fill(0, 0, 0);
    if (button) {
    if (!rolling){
      rolling = true;
    }
    machine.roll();
    fill(0,0,0);
    textSize(19);
    text("Stop",x,y);
  } else {
    if (rolling){
      rolling = false;
      int dice_0 = int(random(6));
      player.posX += player.speedR * (dice_0+1);
      if (status == GAME_MAP_3 && player.posX >= width -5) {
        player.posX = 922;
      }
      player.isPlay = true;
      soundPlay = true;
       machine.setSlotDice(0, dice_0);   
    }
    machine.stop();
    fill(0,0,0);
    textSize(19);
    text("Roll",x,y);
  }
}



void checkMoveDistance() {
  switch(moveDistance) {
    case 1:
    player.posX += 66;
    break;
    
    case -1:
    player.posX -= 66;
    break;
    
    case 2:
    player.posX += 132;
    break;
    
    case -2:
    player.posX -= 132;
    break;
    
    case 3:
    player.posX += 198;
    break;
    
    case -3:
    player.posX -= 198;
    break;
  }
}

void checkWindow() {
  switch(window) {
    case 1:
    status = GAME_MAP_1;
    break;
    
    case 2:
    status = GAME_MAP_2;
    break;
    
    case 3:
    status = GAME_MAP_3;
    break;
  }
}


void nextMap() {
  if(status == GAME_MAP_1) {
    if(player.posX >= width -5) {
      player.posX = player.posX - width + 10;
      status = GAME_MAP_2;
    }
  }
  if(status == GAME_MAP_2) {
    if(player.posX >= width -5) {
      status = GAME_MAP_LOAD;
      currentTime = millis();
    }
  }
}

void printText(String title, int y, int size){
  myFont = createFont("微軟正黑體",20);
  textFont(myFont);
  fill(95, 194, 226);
  textSize(size);
  text(title, width/2, y);
}

void reset() {
  player.posX = -2;
  player.posY = 186;
  count = 301;
  question.qStatus = 0;
  soundPlay = true;
  player.isPlay = true;
}

void keyPressed() {
  if (status == GAME_MAP_1 || status == GAME_MAP_2 || status == GAME_MAP_3) {
    player.keyTyped(); 
  }
  statusCtrl();
  cheatKeys();
}

void statusCtrl() {
  if (key == ENTER) {
    switch(status) {
      
      case GAME_START:
      status = GAME_RULE;
      reset();
      break;
      
      case GAME_RULE:
      status = GAME_MAP_1;
      break;
      
      case GAME_WIN:
      status = GAME_MAP_1;
      reset();
      break;
      
      case GAME_LOSE:
      status = GAME_MAP_1;
      reset();
      break;
    }
  }
}



void statusCtrl_map_1() {
  if (player.isPlay) {
    if (player.posY > 156 && player.posY < 216) {   
        if (player.posX > 100 && player.posX < 160) {   //q1
          currentTime = millis();
          window = 1;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 0;
        }
        if (player.posX > 430 && player.posX < 488) {    //q2
          currentTime = millis();
          window = 1;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 1;
        }
        if (player.posX > 628 && player.posX < 686) {   //q3
          currentTime = millis();
          window = 1;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 2;
        }
        if (player.posX > 232 && player.posX < 292
        || (player.posX > 892 && player.posX < 950)) {   //chance
          currentTime = millis();
          window = 1;
          chance.statement = int(random(5));
          status = CHANCE_WINDOW;
          player.isPlay = false;
        }
        if (player.posX > 562 && player.posX < 620) {   //destiny
          currentTime = millis();
          window = 1;
          destiny.statement = int(random(5));
          status = DESTINY_WINDOW;
          player.isPlay = false;
        }
        if (player.posX > 364 && player.posX < 422) {  //-2
          currentTime = millis();
          window = 1;
          moveDistance = -2;
          status = MOVE_WINDOW;
        }
        if (player.posX > 760 && player.posX < 818) {  //+2
          currentTime = millis();
          window = 1;
          moveDistance = 2;
          status = MOVE_WINDOW;
        }
      }
  }
}

void statusCtrl_map_2() {
  if (player.isPlay) {
    if (player.posY > 156 && player.posY < 216) {     
        if (player.posX > -30 && player.posX < 28) {  //q4
          currentTime = millis();
          window = 2;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 3;
        }
        if (player.posX > 298 && player.posX < 358) {   //q5
          currentTime = millis();
          window = 2;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 4;
        }
        if (player.posX > 432 && player.posX < 488) {   //q6
          currentTime = millis();
          window = 2;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 5;
        }
        if (player.posX > 890 && player.posX < 950) {   //q7
          currentTime = millis();
          window = 2;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 6;
        }
        if (player.posX > 694 && player.posX < 752) {    //chance
          currentTime = millis();
          window = 2;
          chance.statement = int(random(5));
          status = CHANCE_WINDOW;
          player.isPlay = false;
        }
        if ((player.posX > 168 && player.posX < 226)
       || (player.posX > 826 && player.posX < 884)) {   //destiny
          currentTime = millis();
          window = 2;
          destiny.statement = int(random(5));
          status = DESTINY_WINDOW;
          player.isPlay = false;
        }
        if (player.posX > 102 && player.posX < 160) {  // +1
          currentTime = millis();
          window = 2;
          moveDistance = 1;
          status = MOVE_WINDOW;
        }
        if (player.posX > 498 && player.posX < 554) {  //+3
          currentTime = millis();
          window = 2;
          moveDistance = 3;
          status = MOVE_WINDOW;
        }
        if (player.posX > 628 && player.posX < 686) {  //-3
          currentTime = millis();
          window = 2;
          moveDistance = -3;
          status = MOVE_WINDOW;
        }
      }
  }
}

void statusCtrl_map_3() {
  if (player.isPlay) {
    if (player.posY > 156 && player.posY < 216) {     
        if (player.posX > 36 && player.posX < 94) {   //q8
          currentTime = millis();
          window = 3;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 7;
        }
        if (player.posX > 432 && player.posX < 488) {   //q9
          currentTime = millis();
          window = 3;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 8;
        }
        if (player.posX > 760 && player.posX < 818) {   //q10
          currentTime = millis();
          window = 3;
          status = QUIZ_WINDOW;
          player.isPlay = false;
          question.status = 9;
        }
        if ((player.posX > 100 && player.posX < 160)
         || (player.posX > 562 && player.posX < 620)) {    //chance
          currentTime = millis();
          window = 3;
          chance.statement = int(random(5));
          status = CHANCE_WINDOW;
          player.isPlay = false;
        }
        if (player.posX > 366 && player.posX < 422) {   //destiny
          currentTime = millis();
          window = 3;
          destiny.statement = int(random(5));
          status = DESTINY_WINDOW;
          player.isPlay = false;
        }
        if (player.posX > -30 && player.posX < 28) {  // +2
          currentTime = millis();
          window = 3;
          moveDistance = 2;
          status = MOVE_WINDOW;
        }
        if (player.posX > 826 && player.posX < 884) {  //-2
          currentTime = millis();
          window = 3;
          moveDistance = -2;
          status = MOVE_WINDOW;
        }
        if (player.posX > 232 && player.posX < 292) {  //-3
          currentTime = millis();
          window = 3;
          moveDistance = -3;
          status = MOVE_WINDOW;
        }
        if (player.posX > 890 && player.posX < 950) {   //win
          currentTime = millis();
          status = WIN_WINDOW;
          player.isPlay = false;
        }
      }
  }
}

void cheatKeys() {
  if ((key == 'Q' || key == 'q') 
  && status >= 2 && status <= 4) {
    status--;
  }
  if ((key == 'W' || key == 'w') 
  && status >= 1 && status <= 3) {
    status++;
  }
  if ((key == 'E' || key == 'e') 
  && (status == GAME_CHANCE || status == GAME_DESTINY
  || status == GAME_QUIZ)) {
    checkWindow();
  }
}

void mousePressed() {
  if (status == GAME_QUIZ) {
    question.mousePressed();
  }
  if ((mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) &&
  (status == GAME_MAP_1 || status == GAME_MAP_2 || status == GAME_MAP_3)) {
    button = !button;
  }  
  if (mouseX > 740 && mouseX < 810 && mouseY > 340 && mouseY < 390) {
    if (status == GAME_CHANCE) {
    checkWindow();
    chance.move();
    player.isPlay = true;
    soundPlay = true;
  }
  if (status == GAME_DESTINY) {
    checkWindow();
    destiny.move();
    player.isPlay = true;
    soundPlay = true;
  }
  }
  if (question.status == 10
  && (mouseX>=440 && mouseX<=520 && mouseY>=310 && mouseY<=350)) {
    checkWindow();
    question.qStatus = 0;
  }
  if (question.status == 11
  && (mouseX>=440 && mouseX<=520 && mouseY>=180 && mouseY<=220)) {
    checkWindow();
    question.qStatus = 0;
    count -= 10;
  }
  
}
