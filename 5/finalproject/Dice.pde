class Dice{
  int diceId;
  int score;
  String imgPath;
  PImage img;
  
  Dice(int fid, int score){
    this.diceId = fid;
    this.score = score;
    this.imgPath = "data/0"+diceId+".png";
    this.img = loadImage(imgPath); 
  }
  
  void display(int x, int y, int w, int h){
    image(this.img, x, y, w, h);
  }
  
}
