class Destiny{
  String imgPath;
  PImage img;
  int statement;
  int x;
  int y;
  
  Destiny(){
    x = 0;
    y = 0;
  }
  
  void display() {
    switch(statement){
      case 0:
      this.imgPath = "data/destiny_00.png";
      this.img = loadImage(imgPath);
      image(this.img, 0, 0);
      break;
      case 1:
      this.imgPath = "data/destiny_01.png";
      this.img = loadImage(imgPath);
      image(this.img, 0, 0);
      break;
      case 2:
      this.imgPath = "data/destiny_02.png";
      this.img = loadImage(imgPath);
      image(this.img, 0, 0);
      break;
      case 3:
      this.imgPath = "data/destiny_03.png";
      this.img = loadImage(imgPath);
      image(this.img, 0, 0);
      break;
      case 4:
      this.imgPath = "data/destiny_04.png";
      this.img = loadImage(imgPath);
      image(this.img, 0, 0);
      break;
    }
  }
  
  void move(){
    switch(statement){
      case 0:
      player.posX -= 198;
      break;
      case 1:
      player.posX -= 198;
      break;
      case 2:
      player.posX -= 132;
      break;
      case 3:
      player.posX -= 66;
      break;
      case 4:
      player.posX -= 132;
      break;
    }
  }
  
}
