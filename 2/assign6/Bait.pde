class Bait{
      int x;
      int y;
      boolean gone = false;
      
      Bait(){
        this.x=0;
        this.y=0;
      }

      void setBait(Snake snake){
        x= int(random(width));
        y= int(random(height));
        
        if(x==snake.x && y== snake.y){
       x=int(random(width));
       y =int(random(height));}
        
        
      }
      
      void baitShow(){
      rectMode(CENTER);
        fill(238, 64, 0);
        rect(x,y, 30,30,50);
      }
}
