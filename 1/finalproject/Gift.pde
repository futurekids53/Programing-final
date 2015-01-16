class Gift{
float x;
float y;
float size;
float xSpeed;
float ySpeed;




Gift(){
 x=random(-75,width+75);
  y=random(-75,height+75);
 while(x >= -20 && x <= width+20 && y >= -20 && y <= height+20){
    x=random(-75,width+75);
    y=random(-75,height+75);
    }
  xSpeed = 3*int(random(-1,1));
    while(xSpeed == 0){
      xSpeed = 3*int(random(-1,1));
    }
    ySpeed = 3*int(random(-1,1));
    while(ySpeed == 0){
      ySpeed = 3*int(random(-1,1));
    }
  size=80;
}

void display(){
  image(gift,x,y,size,size);
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
  x=random(-75,width+75);
  y=random(-75,height+75);
 while(x >= -20 && x <= width+20 && y >= -20 && y <= height+20){
    x=random(-75,width+75);
    y=random(-75,height+75);
    }
}


}
