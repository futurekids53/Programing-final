class Circle{
  float [] posX = new float [15];
  float [] posY = new float [15];

  
  Circle(){
    for (int i = 0; i < posX.length; i++ ) {
     posX[i] = 0;
     posY[i] = 0; 
    }
  }
  
  void display(){
    posX[14] = ur.posX + ur.size/2;
    posY[14] = ur.posY + ur.size*2/3;
    for (int j = 0; j < posX.length - 1; j++){
      posX[j] = posX[j+1];
      posY[j] = posY[j+1];
      float size = 5 + 0.7 * j; 
      fill(178,83,71);
      ellipse(posX[j], posY[j], size, size);
      ellipse(posX[14], posY[14], 12, 12);
    }
  }
}
