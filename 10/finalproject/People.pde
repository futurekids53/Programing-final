class People{
      int x;
      int y;
      ArrayList<Cloth> itemGet;
      People(int x ,int y){
        this.x=x;
        this.y=y;
        this.itemGet=new ArrayList<Cloth>();
      }
      void show(Img img){
        image(img.naked,this.x,this.y,peopleSize,peopleSize*1731/1104);
      }
      void showList(Img img){
        for(int i=0;i<this.itemGet.size();i++){
            this.itemGet.get(i).show(img,"cart",i);
        }
      }

      
}
