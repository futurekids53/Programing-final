class Img{
      PImage Begin,Win,Lose,playing,targeting;
      PImage naked;
      PImage [][] cloth  = new PImage[3][3];
      PImage [][] closet = new PImage[3][3];
      Img(){
       this.Begin = loadImage("data/begin.png");
       this.playing = loadImage("data/playing.jpg");
       this.targeting = loadImage("data/targeting.png");
       this.Win = loadImage("data/GAME_WIN.png");
       this.Lose = loadImage("data/GAME_LOSE.png"); 
       this.naked = loadImage("data/naked.png");
       for(int i=1;i<=3;i++){
         for(int j=1;j<=3;j++){
          cloth[i-1][j-1]=loadImage("data/"+i+"_"+j+"c.png"); 
          }
         }
       }
}
