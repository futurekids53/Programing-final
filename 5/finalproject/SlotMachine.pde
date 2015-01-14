class SlotMachine{
  int initX = 830;
  int initY = 367;
  int m=1, n=1;
  int [] diceNumbers = {0,1,2,3,4,5};
  int [] diceScores = {60,10,20,30,40,50};
  Dice [] dices; 
  Dice [][] animatedSlots;  // this one is for animation
  Dice [][] slots;          // this one is for assignment use,
                             // students can only access "slots"
  
  SlotMachine(){
    // setup fruits
    dices = new Dice[diceNumbers.length];
    for (int i=0; i<diceNumbers.length; i++){
      dices[i] = new Dice(diceNumbers[i], diceScores[i]);
    }
    // init slots
    animatedSlots = new Dice[m][n];
    slots = new Dice[m][n];

    initSlot();
  }
  
  void initSlot(){
    for (int i=0; i<m; i++){
      for (int j=0; j<n; j++){
        setSlotDice(i,0); 
      }
    }
  }
  
// easy version
 void setSlotDice(int x, int fid){
    slots[x][0] = dices[fid];
  }
  
  void displaySlots(){
    for (int i=0; i<m; i++){
      for (int j=0; j<n; j++){
        slots[i][j].display(initX+i*100,initY+j*100,62,82);
      }
    }
  }
  
  void roll(){
    for (int i=0; i<m; i++){
      for (int j=0; j<n; j++){
        int rnd = int(random(diceNumbers.length));
        animatedSlots[i][j] = dices[rnd];
        animatedSlots[i][j].display(initX+i*100,initY+j*100,62,82);
      }
    }
  }
  
  void stop(){
    displaySlots();
  }
  
  int getSlotScore(int num){
    return diceScores[num];
  }
  
  int getDiceCount(int fid){
    int count=0;
    for (int i=0; i<m; i++){
      for (int j=0; j<n; j++){
        if ( slots[i][j].diceId == fid){
          count++;
        }
      }
    }
    return count;
  }
  
  int probability(float p){
    return ( random(1) < p ? 1 : 0);
  }
  
}
