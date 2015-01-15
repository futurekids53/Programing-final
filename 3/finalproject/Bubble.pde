class Bubble{
  
  float bX;
  float bY;
  float diameter;
  float speed;

  Bubble(float x,float y) {
    bX = x;
    bY = y;
    speed = random(1,3);
    diameter = 25;
  }

  void ascend() {
    bY -= speed;
    bX = bX + random(-2,2);
  }

  void display() {
    noStroke();
    fill(174,238,238,180);
    ellipse(bX, bY, diameter, diameter);
  }

  void top() {
    if (bY < diameter/2+100) {
      bY = diameter/2;
    }
  }



}
