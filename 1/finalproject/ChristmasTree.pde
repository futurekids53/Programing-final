class ChristmasTree{
float x;
float y;
float size;


ChristmasTree(){
  x=mouseX;
  y=mouseY;
}

void display(){
   size=santaSize*5;
  image(christmasTree,mouseX,mouseY,size,size);
}

 

}
