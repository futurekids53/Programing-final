class Cookie{
float x;
float y;
float size;
float xSpeed;
float ySpeed;
color c;
//float a1;
//float a2;
//float a3;
int score;



Cookie(){
  x=random(-50,width+50);
  y=random(-50,height+50);
  c= color(random(255),random(255),random(255));
  while(x >= -20 && x <= width+20 && y-20 >= 0 && y <= height+20){
    x=random(-50,width+50);
    y=random(-50,height+50);
    }
  size=random(santaSize-10,santaSize+30);
  xSpeed=random(-3,3);
  ySpeed=random(-3,3);
}

void display(){
  fill(c);
  stroke(0);
  ellipse(x,y,size,size);
}

void move(){
  x+=xSpeed;
  y+=ySpeed;
}

void checkEdge(){
  if(x<-100){
   x=-100;
   xSpeed*=-1;
   size=random(santaSize-10,santaSize+30);
  }else if (x>width+100){
   x=width+100;
   xSpeed*=-1;
   size=random(santaSize-10,santaSize+30);
  }else if (y<-100){
   y=-100; 
   ySpeed*=-1; 
   size=random(santaSize-10,santaSize+30);
  }else if (y>height+100){
   y=height+100;
   ySpeed*=-1; 
   size=random(santaSize-10,santaSize+30);
  }
}

void disappear(){
 point+=1;
  x=random(-50,width+50);
  y=random(-50,height+50);
  while(x >= -20 && x <= width+20 && y >= -20 && y <= height+20){
    x=random(-50,width+50);
    y=random(-50,height+50);
    }

  }
}
