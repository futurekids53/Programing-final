Student [] students;
Teacher teacher;
EyeLaser eyelaser;
TA ta;
Fink fink;
StudentC studentC;

import ddf.minim.*;   
Minim minim; 
AudioPlayer song; 

float paperX, paperY, paperInitX, paperInitY;
int life =3;
final int GAME_START   = 0;
final int RULE    = 11;
final int GAME_PLAYING = 1;
final int GAME_PAUSE   = 2;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;
final int LEVEL2   = 5;
final int LEVEL3  = 6;
final int LEVEL4  = 7;
final int LEVEL2_PLAYING=8;
final int LEVEL3_PLAYING=9;
final int LEVEL4_PLAYING=10;
final int  GAME_DIE=12;
final int  GAME_DIE2=13;
final int  GAME_DIE3=14;
final int  GAME_DIE4=15;
final int  GAME_PAUSE2=16;
final int  GAME_PAUSE3=17;
final int  GAME_PAUSE4=18;
int status;
int ii ;
int jj ;
PImage imgHelper;
PImage imgYou, imgTeacher, imgTA;
PImage imgWin, imgLose, imgPause;
PImage imgStart, imgRule;
PImage imgPaper;
PImage imgBackground;
PImage imgLevel2;
PImage imgLevel3;
PImage imgLevel4;

void setup() {
   status = GAME_START;
   size(640,480);
   background(0, 0, 0);
   imageMode(CENTER);
   
   //initial position of paper
   paperInitX = 145;
   paperInitY = 115;
  
  minim = new Minim(this);   
  song = minim.loadFile("data/music.mp3");   
  song.play();  // song.pause();  
    

   
   //prepare the images
 ///  imgStudent=loadImage("data/student.png");
   imgHelper=loadImage("data/helper.png");
   imgYou=loadImage("data/you.png");
   imgTeacher=loadImage("data/t.png");
   imgTA=loadImage("data/TA.png");
   imgPaper=loadImage("data/paper.png");
   imgWin=loadImage("data/Win.png");
   imgLose=loadImage("data/Lose.png");
   imgPause=loadImage("data/pause.png");
   imgStart=loadImage("data/cheat game.png");
   imgRule=loadImage("data/rule.png");
   imgBackground=loadImage("data/Background3.png");
   imgLevel3=loadImage("data/level3_1.png");
   imgLevel4=loadImage("data/level4.png");
   imgLevel2=loadImage("data/level2.png");
   
   reset();
}

void draw() {
  background(50, 50, 50);
  noStroke();
  rectMode(CENTER);

  switch(status) {

  case GAME_START:
       image(imgStart,width/2,height/2);
       break;
  case RULE:
       image(imgRule,width/2,height/2);
       break;
  case GAME_PLAYING:
       image(imgBackground,width/2,height/2);
       
       teacher.display();
       teacher.move();
       for (int i=0; i<students.length; i++){
          students[i].display();
       } 
       studentC.display();
       //draw paper
       image(imgPaper,paperX,paperY);
       eyelaser.display(); 
       eyelaser.move(teacher);
       drawLife();
       checkWin();
       checkLose();    
       break;
 case LEVEL2:
       image(imgLevel2,width/2,height/2);
       break;
 case LEVEL2_PLAYING:
      image(imgBackground,width/2,height/2);
       
       teacher.display();
       teacher.move();
       for (int i=0; i<students.length; i++){
          students[i].display();
       }
       studentC.display();
       //draw paper
       image(imgPaper,paperX,paperY);
       eyelaser.display(); 
       eyelaser.move(teacher);
       drawLife();
       checkWin2();
       checkLose2();    
       break;
 case LEVEL3:
       image(imgLevel3,width/2,height/2);
       break;
 case LEVEL3_PLAYING:
       image(imgBackground,width/2,height/2);
       teacher.display();
       teacher.move();
       for (int i=0; i<students.length; i++){
          students[i].display();
       } 
       studentC.display();
       fink.display();
       //draw paper
       image(imgPaper,paperX,paperY);
       eyelaser.display(); 
       eyelaser.move(teacher);
       drawLife();
       checkWin3();
       checkLose3();    
      break;
   case LEVEL4:
      image(imgLevel4,width/2,height/2);
      break; 
  case LEVEL4_PLAYING:
    image(imgBackground,width/2,height/2);
       
       teacher.display();
       teacher.move();
       ta.move();
       for (int i=0; i<students.length; i++){
          students[i].display();
       } 
       studentC.display();
       fink.display();
       //draw paper
       image(imgPaper,paperX,paperY);
       ta.display();
       eyelaser.display(); 
       eyelaser.move(teacher);
       drawLife();
       
       checkWin4();
       checkLose4();    
      break;
  case GAME_DIE:
  teacher.tX=560;
  teacher.tY=70;
 paperX=paperInitX;
   paperY=paperInitY;
status = GAME_PLAYING;
  break;
  case GAME_DIE2:
    teacher.tX=560;
  teacher.tY=70;
 paperX=paperInitX;
   paperY=paperInitY;
status = LEVEL2_PLAYING;

       break;
  case GAME_DIE3:
    teacher.tX=560;
  teacher.tY=70;
 paperX=paperInitX;
   paperY=paperInitY;
   int b=int(random(1,23));
   fink= new Fink( students[b].sX,students[b].sY );
status = LEVEL3_PLAYING;

       break;
  case GAME_DIE4:
    teacher.tX=560;
  teacher.tY=70;
 paperX=paperInitX;
   paperY=paperInitY;
int c=int(random(1,23));
   fink= new Fink( students[c].sX,students[c].sY );
status = LEVEL4_PLAYING;

       break;
  case GAME_PAUSE:
       image(imgPause,width/2,height/2);
       break;
 case GAME_PAUSE2:
       image(imgPause,width/2,height/2);
       break;
  case GAME_PAUSE3:
       image(imgPause,width/2,height/2);
       break;
   case GAME_PAUSE4:
       image(imgPause,width/2,height/2);
       break;
  case GAME_WIN:
      image(imgWin,width/2,height/2);
      break;

  case GAME_LOSE:
    image(imgLose,width/2,height/2);
    break;
  }
}

void keyPressed() {

  if (status == GAME_PLAYING||status == LEVEL2_PLAYING||status == LEVEL3_PLAYING||status == LEVEL4_PLAYING) {
   if (key == CODED ) {
      switch(keyCode){
        case UP:
               if(paperY <= height - 150 && paperY >= 115) {
                 paperY -= 70;
               }      
               break;
        case DOWN:
               if(paperY <= height - 150 && paperY >= 115) {
                  paperY += 70;
               } 
               break;
        case LEFT:
               if(paperX <= width - 100 && paperX >= 145) {
                  paperX -= 70;
               } 
               break;
        case RIGHT:
               if(paperX <= width - 100 && paperX >= 145) {
                  paperX += 70;
               } 
               break;
    }
    
    if(paperX >= width - 150){
      paperX = width - 150;
    } 
    if(paperX < 145){
      paperX = 145;
    }
    if(paperY >= height - 155){
      paperY = height - 155;
    }
    if(paperY <= 115){
      paperY = 115;
    }
  }
  }
  statusCtrl();
}

void studentMaker(int total, int numInRow) {

  int ox = 150; 
  int oy = 150; 
  int xSpacing = 70; 
  int ySpacing = 70; 

  for (int i=0; i <total; ++i) {

    int x = ox + (xSpacing*(i % numInRow));
    int y = oy + (ySpacing*int(i / numInRow));

    students[i]= new Student(x, y);
  }
}

void checkWin() {
if(key == ' ' && paperX >= studentC.cX-30 && paperX <= studentC.cX+30
&& paperY <= studentC.cY+30&& paperY >= studentC.cY-60) {
status = LEVEL2;
}
}
void checkWin2() {
if(key == ' ' && paperX >= studentC.cX-30 && paperX <= studentC.cX+30
&& paperY <= studentC.cY+30&& paperY >= studentC.cY-60) {
status = LEVEL3;
}
}
void checkWin3() {
if(key == ' ' && paperX >= studentC.cX-30 && paperX <= studentC.cX+30
&& paperY <= studentC.cY+30&& paperY >= studentC.cY-60) {
status = LEVEL4;
}
}
void checkWin4() {
if(key == ' ' && paperX >= studentC.cX-30 && paperX <= studentC.cX+30
&& paperY <= studentC.cY+30&& paperY >= studentC.cY-60) {
status = GAME_WIN;
}
}
void checkLose() {  
   PVector V1 =  PVector.fromAngle(radians(eyelaser.ang));
   PVector V2 =  PVector.fromAngle(radians(eyelaser.ang+30));
   PVector V3 = new PVector(paperX-eyelaser.eX, paperY - eyelaser.eY);
   float r1 =PVector.angleBetween(V1,V3);
   float r2 =PVector.angleBetween(V2,V3);
   float D = dist(eyelaser.eX, eyelaser.eY, paperX, paperY);
   if(r1+r2<=radians(30) && D<= eyelaser.eSize) {
     life--;
     status = GAME_DIE;
   }
   if (life==0){
       status = GAME_LOSE;
   }
}
void checkLose2(){
  PVector V1 =  PVector.fromAngle(radians(eyelaser.ang));
   PVector V2 =  PVector.fromAngle(radians(eyelaser.ang+30));
   PVector V3 = new PVector(paperX-eyelaser.eX, paperY - eyelaser.eY);
   float r1 =PVector.angleBetween(V1,V3);
   float r2 =PVector.angleBetween(V2,V3);
   float D = dist(eyelaser.eX, eyelaser.eY, paperX, paperY);
   if(r1+r2<=radians(30) && D<= eyelaser.eSize) {
      life--;
     status = GAME_DIE2;
   } 
   if (life==0){
       status =GAME_LOSE;
   }
}
void checkLose3() {  
   PVector V1 =  PVector.fromAngle(radians(eyelaser.ang));
   PVector V2 =  PVector.fromAngle(radians(eyelaser.ang+30));
   PVector V3 = new PVector(paperX-eyelaser.eX, paperY - eyelaser.eY);
   float r1 =PVector.angleBetween(V1,V3);
   float r2 =PVector.angleBetween(V2,V3);
   float D = dist(eyelaser.eX, eyelaser.eY, paperX, paperY);
   if(r1+r2<=radians(30) && D<= eyelaser.eSize) {
       life--;
     status = GAME_DIE3;
   }
  
    if(paperY>=fink.fY-60&&paperY<=fink.fY+30&&paperX>=fink.fX-30&&paperX<=fink.fX+30){
        life--;
     status = GAME_DIE3;
}//fink detects paper
 if (life==0){
       status =GAME_LOSE;
   }
}
void checkLose4() {  
   PVector V1 =  PVector.fromAngle(radians(eyelaser.ang));
   PVector V2 =  PVector.fromAngle(radians(eyelaser.ang+30));
   PVector V3 = new PVector(paperX-eyelaser.eX, paperY - eyelaser.eY);
   float r1 =PVector.angleBetween(V1,V3);
   float r2 =PVector.angleBetween(V2,V3);
   float D = dist(eyelaser.eX, eyelaser.eY, paperX, paperY);
   if(r1+r2<=radians(30) && D<= eyelaser.eSize) {
      life--;
     status = GAME_DIE4;
   }
  
    if(paperY>=fink.fY-60&&paperY<=fink.fY+30&&paperX>=fink.fX-30&&paperX<=fink.fX+30){
        life--;
     status = GAME_DIE4;
}//fink detects paper

  if(paperY>=ta.ty-15&&paperY<=ta.ty+15){
  if((ta.tx>=paperX-55&&ta.tx<=paperX+55)){
      life--;
     status = GAME_DIE4;
}//TA detects paper
}
if (life==0){
       status =GAME_LOSE;
   }
}
void drawLife() {
  rectMode(CORNER);
  fill(230, 74, 96);
  text("LIFE:", 36, 455);

  int ox = 78; 
  int oy = 459;
  int spacing = 25;
  int diameter = 15;

  for (int i=0; i<life; i++) {
    int x = ox + spacing*i;
    int y = oy;
    ellipse(x, y, diameter, diameter);
  }
}

void printText(int x, int y, int size1, int size2, int distance, String line1, String line2) {
  colorMode(RGB);
  fill(95, 194, 226);
  textSize(size1);
  textAlign(CENTER, CENTER);
  text(line1, x, y);

  fill(95, 194, 226);
  textSize(size2);
  text(line2, x, y+distance);
}

void reset() {
   rectMode(CENTER);
   life=3;
   ii = int(random(0,5));
   jj = 2;
   students = new Student[24];
   studentMaker(24,6);
   int a=int(random(1,23));
   fink= new Fink( students[a].sX,students[a].sY );
   teacher = new Teacher(560,70);
   eyelaser = new EyeLaser();
   paperX=paperInitX;
   paperY=paperInitY;
   ta= new TA(185,360);
   studentC= new StudentC( students[23].sX,students[23].sY );
}

void statusCtrl() {
  
  if (status == LEVEL2_PLAYING||status == LEVEL3_PLAYING||status == LEVEL4_PLAYING) {
   if (key == CODED ) {
      switch(keyCode){
        case UP:
              if(paperY > 110+70*jj && paperY < 120+70*jj
              && paperX > 140+70*ii && paperX < 150+70*ii){
                 paperY += 70;
               }
               break;
        case DOWN:
              if(paperY > 110+70*jj && paperY < 120+70*jj
               && paperX > 140+70*ii && paperX < 150+70*ii){
                 paperY -= 70;
               } 
               break;
        case LEFT:
               if(paperX > 140+70*ii && paperX < 150+70*ii
               && paperY > 110+70*jj && paperY < 120+70*jj){
                 paperX += 70;
               } 
               break;
        case RIGHT:
               if(paperX > 140+70*ii && paperX < 150+70*ii
               && paperY > 110+70*jj && paperY < 120+70*jj){
                 paperX -= 70;
               }
               break;
    }
   }
}

  if (key == ENTER) {
    switch(status) {

    case GAME_START:
     status=RULE;
      break;
   case RULE:
    status = GAME_PLAYING;
      reset();
      break;
   
    case GAME_PLAYING:
      status = GAME_PAUSE;

      break;
   case LEVEL2:
    status = LEVEL2_PLAYING;
      reset();
        break;
   case LEVEL3:
    status = LEVEL3_PLAYING;
      reset();
      break;
   case LEVEL4:
     status = LEVEL4_PLAYING;
      reset();
      break;
   case LEVEL2_PLAYING:
   status = GAME_PAUSE2;
   break;
    case LEVEL3_PLAYING:
   status = GAME_PAUSE3;
   break;
    case LEVEL4_PLAYING:
   status = GAME_PAUSE4;
   break;
    case GAME_PAUSE:
      status = GAME_PLAYING;
      break;
      case GAME_PAUSE2:
      status = LEVEL2_PLAYING;
      break;
    case GAME_PAUSE3:
      status = LEVEL3_PLAYING;
      break;
      case GAME_PAUSE4:
      status = LEVEL4_PLAYING;
      break;
    case GAME_WIN:
      status = GAME_PLAYING;
      reset();
      break;

    case GAME_LOSE:
      status = GAME_PLAYING;
      reset();
      break;
    }
  }
}
