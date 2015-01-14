class Dog {
float dogX, dogY, dogInitX, dogInitY;
int dogW;
int speed;
PImage imgDog;

//boolean keyboard move dog
boolean up;
boolean down;
boolean left;
boolean right;

int life;

Dog(int x, int y,  int l) {
  speed = 5;
  dogW = 50;
      
    this.dogX = x;
    this.dogY = y;
    life = l;
    imgDog = loadImage("data/beach - dog causal.png");
  } 

void display() {
  imageMode(CENTER);
  imgDog.resize(0,dogW);
  image(imgDog,dogX,dogY);  
  }

void move(){
   if( right ) {
         dogX += 5;
      }
       if( left ) {
         dogX -= 5;
      }
       if( up ) {
         dogY -= 5;
      }
       if (down) {
         dogY += 5;
      }
      
       if( dogY < dogW/2 ){
          dogY = dogW/2;
        }
        else if( dogY > height-dogW/2 ){
          dogY = height-dogW/2;
        }
       if( dogX < dogW/2 ){
          dogX = dogW/2;
        }
        
        
        //dog block X

//8
if(dogY <= height/8 && dogY >= 0){
   if (dogX >= width-80){
        dogX = width-80;} }
//2
if(dogY <= height-60 && dogY >= height-120){
   if (dogX >= width/8){
        dogX = width/8;} }
        
//3
if(dogY <= height-120 && dogY >= height/2+60){
   if (dogX >= width/4){
        dogX = width/4;} }
//4
if(dogY <= height/2+60 && dogY >= height/2){
   if (dogX >= width/4+80){
        dogX = width/4+80;} }
        
//5
if(dogY <= height/2 && dogY >= height/2-60){
   if (dogX >= width/2){
        dogX = width/2;} }
        
//6
if(dogY <= height/2-60 && dogY >= height/4){
   if (dogX >= width/2+80){
        dogX = width/2+80;} }
                
//7
if(dogY <= height/4 && dogY >= height/4-60){
   if (dogX >= width-160){
        dogX = width-160;}}
//1
if (dogX >= 0 && dogX <= width/8){
if(dogY >= height-60){
      dogY = height -60;}}

if (dogY <= height && dogY >= height -60){
if (dogX >= 0){
dogX = 0;}}  
        
  }

}
