class Brick {
  int note;  //do,re,mi
  int tempo; //brick length
  int w=30;
  float x; //brick X
  float y; //brick Y
  int xSpacing=80;
  //int h=20;
  //int h1=30;
  //float x; // note
  //float n; //speed  
  int tempoHeight = 40;
  float speedY = 6;
  int h; //height
  boolean gone = false;


  Brick(int note, int tempo) {
    this.x = xSpacing*(note-1)+25;
    this.h = tempo*tempoHeight ;
    this.note =  note ; 
    //this.speedY=n;
  } 

  void move() {

    y+=speedY;
  }

  void display() {
    fill(255, 255, random(255));
    noStroke();
    //fill(255);
    rect(x, y, w, h-10);
  }
}

