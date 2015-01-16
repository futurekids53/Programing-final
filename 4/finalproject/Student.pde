class Student {
  PImage student = loadImage("data/student.png");
  int sSize = 20;
  int sX;
  int sY;

  Student(int x, int y) {
    sX = x;
    sY = y;
  }

  void display() {
    
    imageMode(CENTER);
   // student.resize(0,100);
    image(student,sX,sY);


  //  ellipse(sX, sY, sSize*2, sSize*2);

  }

  void move() {

  }

  
}
