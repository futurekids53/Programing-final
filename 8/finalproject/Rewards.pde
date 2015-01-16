class Rewards{
  float rX;
  float rY;
  PImage [] rewardsList;
  int currentPosition;
  Rewards(int x,int y){
    rX = x;
    rY = y;
    rewardsList = loadImages("data/reward/reward",".png",5);
    currentPosition = int(random(0,rewardsList.length));
  }
  
  void showReward(){
    image(rewardsList[currentPosition], rX,rY,64,64);
    //println(rX,rY);
  }
  
  void moveReward(){
    rX -= 25;
    /*if(rX<=180){
      rY = 100;
    }*/
  }
}
