class Bait{
      float x;
      float y;
      
      Bait(){
        this.x=0;
        this.y=0;
      }

      void setBait(Snake snake){
        this.x=random(width);
        this.y=random(height);
        
        
        if(this.x/20 !=0 && this.y/20 !=0){    
        if(this.x == snake.x && this.y==snake.y){
        this.x=random(width);
        this.y=random(height);
        }  
        }

   
      }
      void baitShow(){
        fill(28, 213, 128);
        ellipse(x, y, 20, 20);
      }
}
