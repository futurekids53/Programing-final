class KeyBoard {
  AudioPlayer sound ;//file
  //Minim minim ;
  int note;//1
  String soundName;//string
  int xSpacing=80;
  float x;
  PImage appleall =loadImage("data/appleall.png");
  PImage applehalf=loadImage("data/applehalf.png");
  Boolean clicking=false;

  //place,music file
  KeyBoard(int note, String soundName) {
    //minim = new Minim(this);
    this.note=note;
    this.soundName=soundName;
    sound = minim.loadFile(soundName);
    this.x= xSpacing*(note-1)+15;
  } 

  void play() {
    sound.play(1);
  }
  void display() {
    if (clicking==false) {

      image(appleall, x, width*2/3);
      //clicking=!clicking;
    } else {
      image(applehalf, x, width*2/3);
    }
  }

  

  void click() {
    clicking=!clicking;
   // clickCheck();
    println(clicking);
  
}
}
