final int GAME_START = 0;
final int GAME_TARGET = 1;
final int GAME_PLAYING = 2;
final int GAME_WIN = 3;
final int GAME_LOSE = 4;
ArrayList<Cloth>  target  = new ArrayList<Cloth>();
int currentFrame=0;
int life=3;
String pick;
int peopleSize = 100;
int []clothSize={90,85,80};
int [] cart={30,30,30};
float []closetSizeFactor={900.0/600.0,400.0/500.0,0.8};
int status;
People player;
Cloth[] clothes = new Cloth[3];
Img img;

import ddf.minim.*;
Minim minim;
AudioPlayer music;
AudioPlayer winhaha;
AudioPlayer loseoh;

void setup(){
  status = GAME_START;   
  size(640,480);
  img=new Img();
  reset();
  minim=new Minim(this);
  music = minim.loadFile("data/Ukulele.mp3");
  winhaha = minim.loadFile("data/win.mp3");
  loseoh = minim.loadFile("data/lose.mp3");
  music.play();
  winhaha.play();
  loseoh.play();
  
}

void draw(){
  background(255);
  imageMode(CORNER);
  switch(status){
  case GAME_START:
       music.pause();
       winhaha.pause();
       loseoh.pause();
       image(img.Begin,0,0,640,480);
       break;
  case GAME_TARGET:
       music.pause();
       winhaha.pause();
       loseoh.pause();
       image(img.targeting,0,0,640,480);
       imageMode(CENTER);
       for(int i=0;i<3;i++){
         clothes[i].show(img,"run",0);
       }
       
       fill(255);
       textSize(23);
       text("PRESS  ENTER  TO  PLAY",195,465);
       break;
  case GAME_PLAYING:
       
       image(img.playing,0,0,640,480);
       imageMode(CENTER);
       //winhaha.stop();
       music.play();


       
       player.show(img); 
       player.showList(img);
       if(player.x>width-50){
       player.x = width-50;}else if(player.x<50){
         player.x=5;
       }
       for(int i=0;i<target.size();i++){
         target.get(i).move();
         target.get(i).show(img,"run",0);
         if(hitPlayer(target.get(i)) || target.get(i).y>=height+img.cloth[target.get(i).type-1][target.get(i).outlook-1].height/2){
            target.remove(i);
         }
       }
       createTarget(120);
       currentFrame++;
       drawLife();
       gameCheck();
       break;
   
  case GAME_WIN:
       music.pause();
       winhaha.play();
       image(img.Win,0,0,640,480);
  
       break;
   
  case GAME_LOSE:
       music.pause();
       image(img.Lose,0,0,640,480);
       loseoh.play();
       break;
  
  
   }
}



void keyPressed() {
   if(key==CODED){
     switch(keyCode){
      case LEFT:
           player.x-=50;    
           break;
      case RIGHT:
           player.x+=50;
           break;
      default:
           break;     
     }
   }
   if(key==ENTER){
     switch(status){
       case GAME_START:
            reset();
            status=GAME_TARGET;
            break;
       case GAME_TARGET:
            status=GAME_PLAYING;
            break;
       case GAME_PLAYING:
            status=GAME_TARGET;
            break;
       case GAME_LOSE:
            status=GAME_START;
            break;
       case GAME_WIN:
            status=GAME_START;
            break;
       default:
            break;
     }
  }
}
void gameCheck(){
     if(!clothes[0].choose&&!clothes[1].choose&&!clothes[2].choose){
       status=GAME_WIN;
     }
     if(life<=0){
       status=GAME_LOSE;
     }
   
}
 boolean hitPlayer(Cloth cloth){
    int i;
    if(abs(cloth.x-player.x)<(peopleSize*1731/1104-30)
     &&abs(cloth.y-player.y)<(peopleSize*1731/1104-30)){
     for(i=0;i<3;i++){
         if(clothes[i].choose==true && clothes[i].type-1==cloth.type-1 && clothes[i].outlook-1==cloth.outlook-1){
            clothes[i].choose=false;
            player.itemGet.add(clothes[i]);
            break;
         }
         else if(clothes[i].choose==false && clothes[i].type-1==cloth.type-1 && clothes[i].outlook-1==cloth.outlook-1){
            break;
         }
      }
      if(i==3){
        life--;
      }
      return true;
    }  
     return false; 
   
}
void createTarget(int frame){
     if(currentFrame>=frame){
       target.add(new Cloth(int(random(120,600)),0,int(random(1,4)),int(random(1,4))));
       currentFrame=0;
     }
}
void reset(){
     
     life=3;
     currentFrame=0;
     player = new People(width/2,height-(peopleSize*1731/1104)/2);
     clothes=new Cloth[3];
     for(int i=0;i<3;i++){
          clothes[i]=new Cloth((i+1.5)*width/5.0,2.7*height/5.0,i+1,int(random(1,4)));
          clothes[i].choose=true;
     }
}
void drawLife() {
  fill(255, 0, 0);
  noStroke();
  text("LIFE:", 20, 440);
  
    for(int i=0;i<life;i++){
    int xspace = 25*i;
    
    ellipse(78+xspace,459,15,15);
  }
}


