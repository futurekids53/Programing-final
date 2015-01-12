class Pro{
  int x = shadow.x;
  int y = shadow.y;
  int l = shadow.l;
  int h = shadow.h;
  int status;
  boolean hit = false;
  boolean miss = false;
  int counter = 0;
  int endTime = 60-2*correct/3;
  AudioSnippet dingdong;
  AudioSnippet angry;
  
  Pro( int pX,int pY,int pL,int pH){
    this.x = pX;
    this.y = pY;
    this.l = pL;
    this.h = pH;
    dingdong = hi.loadSnippet("data/HI.wav");
    angry = roar.loadSnippet("data/HEY.wav");
  }

  void display(){
    if( shadow.l >= 280 ){
      if( shadow.showUp == 0 ){
        
        PImage pro = loadImage("data/pro.png");
        image(pro, x, y,298,377);
         counter++;
        if(keyPressed){
           if(key == 'z'){
             hit = true;
             time =  millis();
         }
         if(key == '/'){
           
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
          dingdong.play();
          PImage proIn = loadImage("data/pro_in.png");
          image(proIn, 100 ,0,440,480);
          if ( millis() - time >= 200 ){
          doorReset();
          hit = false;
          score+=10;
          correct++;
          }
    }else if(miss == true){
          angry.play();
          x = 1000;          
          PImage proAngry = loadImage("data/pro_angry.png");
          image(proAngry, 49,50 ,519,428 );
          if ( millis() - time >= 200 ){
          doorReset();
          miss = false;
          life--;
          counter = 0;
          }     
    }
  }
}



