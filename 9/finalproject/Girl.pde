class Girl{
  int x = shadow.x;
  int y = shadow.y;
  int l = shadow.l;
  int h = shadow.h;
  boolean hit = false;
  boolean miss = false;
  int counter = 0;
  int endTime = 60-2*correct/3;
  AudioSnippet success;
  AudioSnippet fail;
  
  
  Girl( int gX,int gY,int gL,int gH){
    this.x = gX;
    this.y = gY;
    this.l = gL;
    this.h = gH;
    success = flesh.loadSnippet("flesh.wav");
    fail = scream.loadSnippet("scream.wav");
  }
  
  void display(){
    if( shadow.l >= 280 ){      
      if( shadow.showUp == 1 ){
        
        PImage girl = loadImage("girl.png");
        image(girl, x, y,298,377);
        counter++;
        
        if(keyPressed){
         
         if(key == '/'){
           hit = true;
           time = millis();       
         }
         if(key == 'z' ){
           
           miss = true;
           time = millis();
           
         }           
        }
        
        if(counter == endTime){
          miss = true;
          time = millis();
         }
      }
    }
  }
  
  void delay(){
    if(hit == true){
          x = 1000;
          success.play();
          PImage girlDie = loadImage("girl_dead.png");
          image(girlDie, 30 ,0,640,480);
          if ( millis() - time >= 200 ){
          doorReset();
          hit = false;  
          score += 10;
          correct++;
          }
    }else if(miss == true){
          fail.play();
          x = 1000;          
          PImage girlIn = loadImage("girl_in.png");
          image(girlIn, 100,0 ,440,height );
          if ( millis() - time >= 200 ){
          doorReset();
          miss = false;
          life--;
          counter = 0;
          
          }     
    }
  }
      
  
}
      
