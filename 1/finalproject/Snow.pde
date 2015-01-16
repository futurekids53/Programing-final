class Snow{
float x;
float y;
float size;
float xSpeed;
float ySpeed;




Snow(){
  x=random(-50,width+50);
  y=random(-50,height+50);
 while(x >= -20 && x <= width+20 && y >= -20 && y <= height+20){
    x=random(-50,width+50);
    y=random(-50,height+50);
    }
    xSpeed = 3*int(random(-1,1));
    while(xSpeed == 0){
      xSpeed = 3*int(random(-1,1));
    }
    ySpeed = 3*int(random(-1,1));
    while(ySpeed == 0){
      ySpeed = 3*int(random(-1,1));
    }
  size=50;
}

void display(){
  image(snow,x,y,size,size);
}
void move(){
  x+=xSpeed;
  y+=ySpeed;
}
void checkEdge(){
  if(x<-100 || x>width+100){
   xSpeed*=-1;
  }else if(y<-100 || y>height+100){
  ySpeed*=-1;
  }
}
  
void disappear(){
    x=random(-50,width+50);
        y=random(-50,height+50);
         while(x >= -20 && x <= width+20 && y >=  -20&& y <= height+20){
          x=random(-50,width+50);
          y=random(-50,height+50);
          }
}




}
