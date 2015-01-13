class StudentC {
  PImage You= loadImage("you.png");
int cSize = 30;
int cX;
int cY;

StudentC(int x, int y) {
cX = x;
cY = y;
}
void display() {
image(You,cX,cY);
}
}
