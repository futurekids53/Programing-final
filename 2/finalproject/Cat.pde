class Cat {
float catX, catY, catInitX, catInitY;
int catW;
int speed;
PImage imgCat;

//boolean keyboard move cat
boolean up;
boolean down;
boolean left;
boolean right;

int life;


Cat(int x, int y,  int l) {
  speed = 5;
  catW = 50;
      
    this.catX = x;
    this.catY = y;
    life = l;
    imgCat = loadImage("data/beach - cat.png");
  } 

void display() {
  imageMode(CENTER);
  imgCat.resize(0,catW);
  image(imgCat,catX,catY);
  }

void move(){
   if( right ) {
         catX += 5;
      }
       if( left ) {
         catX -= 5;
      }
       if( up ) {
         catY -= 5;
      }
       if (down) {
         catY += 5;
      }
      
      //keep in range
      if( catY < catW/2 ){
          catY = catW/2;
        }
      else if( catY > height-catW/2 ){
          catY = height-catW/2;
        }
 if( catX > width-catW/2 ){
          catX = width-catW/2;
        }
 
//cat block X
//1
if(catY <= height && catY >= height-30){
   if (catX <= width/8){
        catX = width/8;} }
//2
if(catY <= height-60 && catY >= height-120){
   if (catX <= width/4){
        catX = width/4;} }
        
//3
if(catY <= height-120 && catY >= height/2+60){
   if (catX <= width/2-80){
        catX = width/2-80;} }
//4
if(catY <= height/2+60 && catY >= height/2){
   if (catX <= width/2){
        catX = width/2;} }
        
//5
if(catY <= height/2 && catY >= height/2-60){
   if (catX <= width/2+80){
        catX = width/2+80;} }
        
//6
if(catY <= height/2-60 && catY >= height/4){
   if (catX <= width-160){
        catX = width-160;} }
                
//7
if(catY <= height/4 && catY >= height/4-60){
   if (catX <= width-80){
        catX = width-80;}}
//8
if (catX >= width-80 && catX <= width){
if(catY <= height/4-60){
      catY = height/4 -60;}}
      
if (catY <= height/4-60 && catY >= 0){
 if (catX <= width){
   catX = width;}}
      
}
}


