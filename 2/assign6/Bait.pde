class Bait{
      int x;
      int y;
      int size;
      boolean repeated;
      
      Bait(int size){
        this.x=0;
        this.y=0;
        this.size=size;
      }

      void setBait(Snake snake){ 
        do{
        repeated = false;
        bait.x = int(random(32))*20-10;
        bait.y = int(random(24))*20-10;
        }
        while( bait.x == snake.x && bait.y == snake.y);
      }
      
      void baitShow(){
       fill(0,255,255);
       noStroke();
       ellipse(bait.x, bait.y, size, size);
      }
      
      
}
