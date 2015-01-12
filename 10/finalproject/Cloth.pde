class Cloth{
      float x;
      float y;
      boolean choose;
      int type;//1~3
      int outlook;//1~3
      
      Cloth(float x,float y, int type, int outlook){
        this.x=x;
        this.y=y;
        this.type=type;
        this.outlook=outlook;
        this.choose=false;
      }
      void move(){
        this.y+=2;
      }
      void show(Img img, String pick,int pos){
        if(pick=="run"){
          image(img.cloth[this.type-1][this.outlook-1],this.x,this.y,clothSize[type-1],clothSize[type-1]*closetSizeFactor[type-1]);
        }
        if(pick=="cart"){
          image(img.cloth[this.type-1][this.outlook-1],50*(1+pos),50,cart[type-1],cart[type-1]*closetSizeFactor[type-1]);

        }
        
     }
      
      
}
