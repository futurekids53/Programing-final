class Question {
  String imgPath;
  PImage img;

//Game Status
final int QUESTION_1  = 0;
final int QUESTION_2  = 1;
final int QUESTION_3  = 2;
final int QUESTION_4  = 3;
final int QUESTION_5  = 4;
final int QUESTION_6  = 5;
final int QUESTION_7  = 6;
final int QUESTION_8  = 7;
final int QUESTION_9  = 8;
final int QUESTION_10 = 9;
final int WINWINDER = 10;
final int LOSER = 11;
final int STATUS_NONE = 12;
final int STAGE_1 =0;
final int STAGE_2 =1;
final int STAGE_3 =2;
final int STAGE_4 =3;
final int STAGE_5 =4;
final int QSTATUS_NONE = 6;
final int INFO = 4;
final int QUESTION =0;
final int ANSWER1 =1;
final int ANSWER2 =2;
final int ANSWER3 =3;

boolean gameResult= false;
int correctAnswer; // correct answer 
int status;  
int qStatus = 0;
int titleX = 70;
int titleY = 300;
int qPosY = 350;
int alignLeft = 250;
int a1Y =400;
int a2Y =450;
int a3Y =500;
int rnd;
String context; // context for printtext
int textType;
PImage Q_win;
PImage Q_lose;

  Question(int titleX, int titleY, int qPosY, int a1Y, int a2Y, int a3Y, int alignLeft) {
  this.titleX = titleX;
  this.titleY = titleY;
  this.qPosY = qPosY;
  this.a1Y = a1Y;
  this.a2Y = a2Y;
  this.a3Y = a3Y;
  this.alignLeft = alignLeft;
  Q_win = loadImage("data/Q_win.png");
  Q_lose = loadImage("data/Q_lose.png");
  //status = (int)random(10)+1;
  //myFont = createFont("微軟正黑體",20);
  //textFont(myFont);
  

}

void statusCtrl() {
  noStroke();

  switch(status) {
    
    case QUESTION_1:
        qq1();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break; 

    case QUESTION_2: 
        qq2();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break; 

    case QUESTION_3: 
        qq3();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break;  

    case QUESTION_4: 
        qq4();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break; 

    case QUESTION_5: 
        qq5();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break; 

    case QUESTION_6: 
        qq6();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break; 

    case QUESTION_7: 
        qq7();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break; 

    case QUESTION_8: 
        qq8();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break;      
        
    case QUESTION_9: 
        qq9();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break;

    case QUESTION_10: 
        qq10();
        if(qStatus > 4){
          //qStatus = 5;
          status = LOSER;
          qStatus = 0;
        }
        break;   

    case WINWINDER:
        image(Q_win, 0, 0);
        //textAlign(CENTER);
        fill(255,255,255);
        text("唉唷，不錯喔！恭喜你過關！", 300, height/2); 
        break;
        
    case LOSER:
        image(Q_lose, 0, 0);
        //textAlign(CENTER);
        fill(255,255,255);
        text("= 慘敗！ 你輸輸輸輸輸慘了 =", 300, 350); 
        break;
        
     default:             
          println("None");   
          break;
  }
}


void mousePressed(){
if (qStatus>=0 && qStatus<=4) {
if ( mouseX > 155 && 
mouseX < 155 + 500 && 
mouseY > 220 && 
mouseY < 250) {
if (correctAnswer == 1) {
status = WINWINDER; 
}
if (correctAnswer == 2 || correctAnswer == 3) {
qStatus += 1;
}
}else if(
mouseX > 155 && 
mouseX < 155 + 500 && 
mouseY > 280 - 20 && 
mouseY < 280 + 30 ) {
if (correctAnswer == 2) {
status = WINWINDER; 
}
if (correctAnswer == 1 || correctAnswer == 3) {
qStatus += 1;
}
}else if(
mouseX > 200 && 
mouseX < 200 + 500 && 
mouseY > 330 && 
mouseY < 330 + 30) {
if (correctAnswer == 3) {
status = WINWINDER; 
}
if (correctAnswer == 2 || correctAnswer == 1) {
qStatus += 1;
}
}
}
}
/*
 void keyPressed() {
   if (keyPressed) {
     if (key == '1' && correctAnswer == 1) {
       status = WINWINDER; 
     }else if(key == '2' && correctAnswer == 2){
      status = WINWINDER; 
     }else if(key == '3' && correctAnswer == 3){
       status = WINWINDER; 
     }else{
       qStatus += 1; 
       if(qStatus >= 5  ){
         qStatus = 5;
         status = LOSER;
       }
     }
   } 

   if (keyCode == ENTER) {
    
     println("ww");
     //status = (int)random(10)+1;
   } 
     
   //cheat key
   if (key == CODED) {
       switch( keyCode )
       {  
         case RIGHT:
           qStatus += 1; 
           if(qStatus > 5){
             qStatus = 5;
           }
           break;
          
         case LEFT:
           qStatus -= 1; 
           if(qStatus < 0){
             qStatus = 0;
           }
           break;
       } 
   }
 }

*/
void printtext(String context, int textType){
  rectMode(CORNER);
  switch (textType) {
    case INFO:
      fill(#000000);
      text(context, 150,140);
      break;

    case QUESTION:
     //fill(0,0,0);
      text(context, 150, 200); 
      break;

    case ANSWER1:
      text(context,150, 250);
      // fill(#b00000, 30);
       //rect( alignLeft+100 ,a1Y+70 ,500, 40);
      break;

    case ANSWER2:
      text(context, 150, 300);
      // fill(#b00000, 30);
       //rect(  alignLeft+100 ,a2Y+70 ,500, 40);
      break;

    case ANSWER3:
      text(context, 150, 350);
      // fill(#b00000, 30);
       //rect(alignLeft+100, a3Y+70, 500, 40);
      break;
  }

}

void qq1(){

    switch(qStatus) {
      case 0:
         // fill(#FFA488);
          //rect(0,0,2500,1900,150);
          this.imgPath = "data/q-bg.png";
          this.img = loadImage(imgPath);
          image(this.img, 0, 0);
          
          printtext("  ★身為政大人，你一定知道 >>>>", INFO); 
          printtext("  Q1:下列何者不屬於社資中心館藏？", QUESTION); 
          printtext("  (A) 博碩士論文", ANSWER1);
          printtext("  (B) 國內政府出版品", ANSWER2);    
          printtext("  (C) 中外文雜誌", ANSWER3);      
          correctAnswer = 3;
          break;   
      case 1:
          //fill(#FFA488);
            this.imgPath = "data/q-bg.png";
          this.img = loadImage(imgPath);
          image(this.img, 0, 0);
          printtext("  答錯了！再來看看第二題", INFO); 
          printtext("  Q2:請問：莊敬九舍標榜的文化風格是？", QUESTION); 
          printtext("  (A) 多元化", ANSWER1);
          printtext("  (B) 愛學習", ANSWER2);    
          printtext("  (C) 有愛心", ANSWER3);      
          correctAnswer = 2;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  又錯了！再給你一次機會...", INFO); 
          printtext("  Q3:社資中心當中附設誰的紀念圖書館？", QUESTION); 
          printtext("  (A) 孫中山", ANSWER1);
          printtext("  (B) 蔣中正", ANSWER2);    
          printtext("  (C) 蔣經國", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("  Q4:最後一問：社資中心總共有幾棟？", QUESTION); 
          printtext("  (A) 總共一棟", ANSWER1);
          printtext("  (B) 左棟、右棟", ANSWER2);    
          printtext("  (C) 前棟、後棟", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("  Q5: 最後機會!! 莊敬九舍是男子還女子宿舍？", QUESTION); 
          printtext("  (A) 男", ANSWER1);
          printtext("  (B) 女", ANSWER2);    
          printtext("  (C) 混宿 （表示開心", ANSWER3);      
          correctAnswer = 2;
          break; 
    }
}

void qq2(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  教育為國力之本，你一定知道 >>>>", INFO); 
          printtext("  Q1:下列何者不是教育系教授？", QUESTION); 
          printtext("  (A) 余民寧", ANSWER1);
          printtext("  (B) 馮朝霖", ANSWER2);    
          printtext("  (C) 陳文玲", ANSWER3);      
          correctAnswer = 3;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  答錯了！再來看看第二題", INFO); 
          printtext("  Q2:下列何者不屬於教育學院？", QUESTION); 
          printtext("  (A) 教育系", ANSWER1);
          printtext("  (B) 師資培育中心", ANSWER2);    
          printtext("  (C) 教學發展中心", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  又錯了！再給你一次機會...", INFO); 
          printtext("  Q3:下列何者為教育系畢業系友？", QUESTION); 
          printtext("  (A) 曾志朗", ANSWER1);
          printtext("  (B) 蕭萬長", ANSWER2);    
          printtext("  (C) 吳思華", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("  Q4:最後一問：現任教育學院院長是？", QUESTION); 
          printtext("  (A) 秦夢群", ANSWER1);
          printtext("  (B) 詹志禹", ANSWER2);    
          printtext("  (C) 湯志民", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("  Q5: 最後機會!! 教育學院所在的建築名為？", QUESTION); 
          printtext("  (A) 井塘樓", ANSWER1);
          printtext("  (B) 果夫樓", ANSWER2);    
          printtext("  (C) 百年樓", ANSWER3);      
          correctAnswer = 1;
          break; 
    }
}

void qq3(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  英國研究指出游泳是最快速的減肥方法，請問", INFO); 
          printtext("  Q1:游泳館週一到週六開放時間為？", QUESTION); 
          printtext("  (A) 5:30-21:30", ANSWER1);
          printtext("  (B) 6:00-21:30", ANSWER2);    
          printtext("  (C) 6:30-21:30", ANSWER3);      
          correctAnswer = 2;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  答錯了！再來看看第二題", INFO); 
          printtext("  Q2:下列何者並非憩賢樓整修後新增的設備？", QUESTION); 
          printtext("  (A) 電視", ANSWER1);
          printtext("  (B) 沙發", ANSWER2);    
          printtext("  (C) 吧台", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  又錯了！再給你一次機會...", INFO); 
          printtext("  Q3:身為本校學生，至游泳館單次游泳要多少錢？", QUESTION); 
          printtext("  (A) 30元", ANSWER1);
          printtext("  (B) 40元", ANSWER2);    
          printtext("  (C) 50元", ANSWER3);      
          correctAnswer = 2;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("  Q4:最後一問：下列哪種食物在憩賢樓買不到？", QUESTION); 
          printtext("  (A) 韓式拌飯", ANSWER1);
          printtext("  (B) 早餐三明治", ANSWER2);    
          printtext("  (C) 涼麵", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("  Q5: 最後機會!! 下列有關憩賢樓內店家位置何者錯誤？", QUESTION); 
          printtext("  (A) 電腦先生：一樓", ANSWER1);
          printtext("  (B) 政大光舍：二樓", ANSWER2);    
          printtext("  (C) 金盃美而美：三樓", ANSWER3);      
          correctAnswer = 3;
          break; 
    }
}

void qq4(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  政大人的你一定知道~", INFO); 
          printtext("  Q1:館長室位於中正圖書館幾樓？", QUESTION); 
          printtext("  (A) 一樓", ANSWER1);
          printtext("  (B) 二樓", ANSWER2);    
          printtext("  (C) 三樓", ANSWER3);      
          correctAnswer = 1;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  答錯了！來題簡單的...", INFO); 
          printtext("  Q2:現任商學院院長是誰？", QUESTION); 
          printtext("  (A) 唐揆", ANSWER1);
          printtext("  (B) 林我聰", ANSWER2);    
          printtext("  (C) 蔡維奇", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("  又錯了！再給你一次機會...", INFO); 
          printtext("  Q3:中正圖書館內下列何者是24小時開放的？", QUESTION); 
          printtext("  (A) 1-4樓閱覽區", ANSWER1);
          printtext("  (B) 數位資源學習區", ANSWER2);    
          printtext("  (C) B1悅讀區", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("Q4:最後一問 下列何者不屬於商學院？", QUESTION); 
          printtext("(A) 企管系", ANSWER1);
          printtext("(B) 金融系", ANSWER2);    
          printtext("(C) 經濟系", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("再不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("Q5: 最後機會!! 中正圖書館一樓大廳有誰的雕像？", QUESTION); 
          printtext("(A) 孫中山", ANSWER1);
          printtext("(B) 蔣中正", ANSWER2);    
          printtext("(C) 毛澤東", ANSWER3);      
          correctAnswer = 2;
          break; 
    }
}

void qq5(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("政大人的你一定知道~", INFO); 
          printtext("Q1:果夫樓的前身是什麼？", QUESTION); 
          printtext("(A) 圖書館", ANSWER1);
          printtext("(B) 行政大樓", ANSWER2);    
          printtext("(C) 學生餐廳", ANSWER3);      
          correctAnswer = 2;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("答錯了！來題簡單的...", INFO); 
          printtext("Q2:志希樓的前身是什麼？", QUESTION); 
          printtext("(A) 圖書館", ANSWER1);
          printtext("(B) 行政大樓", ANSWER2);    
          printtext("(C) 學生餐廳", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("又錯了！再給你一次機會...", INFO); 
          printtext("Q3:關於陳果夫先生的敘述何者錯誤？", QUESTION); 
          printtext("(A) 為中國國民黨黨員", ANSWER1);
          printtext("(B) 而立之前就患了癌症", ANSWER2);    
          printtext("(C) 曾經擔任政大教育長", ANSWER3);      
          correctAnswer = 2;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("Q4:最後一問：志希樓是以哪位人士命名？", QUESTION); 
          printtext("(A) 羅家倫", ANSWER1);
          printtext("(B) 胡適", ANSWER2);    
          printtext("(C) 陳獨秀", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("Q5: 最後機會!! 果夫樓和志希樓分別是哪兩個系在使用？", QUESTION); 
          printtext("(A) 心理系、應數系", ANSWER1);
          printtext("(B) 應數系、資科系", ANSWER2);    
          printtext("(C) 資科系、心理系", ANSWER3);      
          correctAnswer = 1;
          break; 
    }
}

void qq6(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("政大人的你一定知道~", INFO); 
          printtext("Q1:四維堂的「四維」指的是什麼？", QUESTION); 
          printtext("(A) 親、愛、精、誠", ANSWER1);
          printtext("(B) 公、誠、勤、毅", ANSWER2);    
          printtext("(C) 禮、義、廉、恥", ANSWER3);      
          correctAnswer = 3;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("答錯了！來題簡單的...", INFO); 
          printtext("Q2:四維堂大概可以容納多少人？", QUESTION); 
          printtext("(A) 4500人", ANSWER1);
          printtext("(B) 3000人", ANSWER2);    
          printtext("(C) 1500人", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("又錯了！再給你一次機會...", INFO); 
          printtext("Q3:四維堂每年年底會舉辦什麼比賽？", QUESTION); 
          printtext("(A) 啦啦隊比賽", ANSWER1);
          printtext("(B) 文化盃合唱比賽", ANSWER2);    
          printtext("(C) 師生趣味競賽", ANSWER3);      
          correctAnswer = 2;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("Q4:最後一問：第四十八屆文化盃比賽冠軍是？", QUESTION); 
          printtext("(A) 企管系", ANSWER1);
          printtext("(B) 傳播學院", ANSWER2);    
          printtext("(C) 國貿系", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("Q5: 最後機會!! 四維堂總共有幾樓？", QUESTION); 
          printtext("(A) 一樓", ANSWER1);
          printtext("(B) 二樓", ANSWER2);    
          printtext("(C) 三樓", ANSWER3);      
          correctAnswer = 2;
          break; 
    }
}

void qq7(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("政大人的你一定知道~", INFO); 
          printtext("Q1:行政大樓現址以前是什麼？", QUESTION); 
          printtext("(A) 操場", ANSWER1);
          printtext("(B) 男生宿舍", ANSWER2);    
          printtext("(C) 圖書館", ANSWER3);      
          correctAnswer = 2;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("答錯了！來題簡單的...", INFO); 
          printtext("Q2:行政大樓大廳有什麼藝術品？", QUESTION); 
          printtext("(A) 陶壁", ANSWER1);
          printtext("(B) 山水畫", ANSWER2);    
          printtext("(C) 雕塑", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("又錯了！再給你一次機會...", INFO); 
          printtext("Q3:行政大樓目前在進行什麼工程？", QUESTION); 
          printtext("(A) 外牆整修", ANSWER1);
          printtext("(B) 擴寬", ANSWER2);    
          printtext("(C) 打掉重建", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("Q4:最後一問：行政大樓總共有幾樓？", QUESTION); 
          printtext("(A) 六樓", ANSWER1);
          printtext("(B) 七樓", ANSWER2);    
          printtext("(C) 八樓", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("Q5: 最後機會!! 行政大樓一進去是幾樓？", QUESTION); 
          printtext("(A) 一樓", ANSWER1);
          printtext("(B) 二樓", ANSWER2);    
          printtext("(C) 三樓", ANSWER3);      
          correctAnswer = 2;
          break; 
    }
}

void qq8(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("政大人的你一定知道~", INFO); 
          printtext("Q1:從下列何種管道看不到政大大學報？", QUESTION); 
          printtext("(A) 臉書", ANSWER1);
          printtext("(B) Uonline大學線上", ANSWER2);    
          printtext("(C) 實體紙本", ANSWER3);      
          correctAnswer = 3;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("答錯了！來題簡單的...", INFO); 
          printtext("Q2:現任傳播學院院長是？", QUESTION); 
          printtext("(A) 鍾蔚文", ANSWER1);
          printtext("(B) 林元輝", ANSWER2);    
          printtext("(C) 孫曼蘋", ANSWER3);      
          correctAnswer = 2;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("又錯了！再給你一次機會...", INFO); 
          printtext("Q3:下列何者不是位於傳播學院的實習單位？", QUESTION); 
          printtext("(A) 政大之聲", ANSWER1);
          printtext("(B) 影音實驗室", ANSWER2);    
          printtext("(C) 傳院劇場", ANSWER3);      
          correctAnswer = 2;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("Q4:最後一問：麥高芬劇團2014冬季公演的劇名為？", QUESTION); 
          printtext("(A) 革命路115號", ANSWER1);
          printtext("(B) 花開富貴", ANSWER2);    
          printtext("(C) 翻船", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("Q5: 最後機會!! 新聞系、廣告系、廣電系在何時合併為傳播學院大一大二不分系？", QUESTION); 
          printtext("(A) 102年", ANSWER1);
          printtext("(B) 103年", ANSWER2);    
          printtext("(C) 104年", ANSWER3);      
          correctAnswer = 2;
          break; 
    }
}

void qq9(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("政大人的你一定知道~", INFO); 
          printtext("Q1:張道藩先生的背景是？", QUESTION); 
          printtext("(A) 台灣文藝運動先鋒", ANSWER1);
          printtext("(B) 台灣社會運動先鋒", ANSWER2);    
          printtext("(C) 台灣商業活動先鋒", ANSWER3);      
          correctAnswer = 1;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("答錯了！來題簡單的...", INFO); 
          printtext("Q2:關於陳百年先生何者錯誤？", QUESTION); 
          printtext("(A) 政大創校以來首任校長", ANSWER1);
          printtext("(B) 中國現代心理學先驅", ANSWER2);    
          printtext("(C) 名大齊，字百年", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("又錯了！再給你一次機會...", INFO); 
          printtext("Q3:哪一部偶像劇曾經在百年樓拍攝？", QUESTION); 
          printtext("(A) 薔薇之戀", ANSWER1);
          printtext("(B) 惡作劇之吻", ANSWER2);    
          printtext("(C) 流星花園", ANSWER3);      
          correctAnswer = 2;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("Q4:最後一問：百年樓廣場的精神堡壘紀念什麼？", QUESTION); 
          printtext("(A) 為國捐軀的政大學生", ANSWER1);
          printtext("(B) 響應文學革命的政大學生", ANSWER2);    
          printtext("(C) 協助開墾台灣的政大學生", ANSWER3);      
          correctAnswer = 1;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("Q5: 最後機會!! 利用道藩樓的是哪個學院？", QUESTION); 
          printtext("(A) 文學院", ANSWER1);
          printtext("(B) 外語學院", ANSWER2);    
          printtext("(C) 社科院", ANSWER3);      
          correctAnswer = 2;
          break; 
    }
}

void qq10(){

    switch(qStatus) {
      case 0:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("政大人的你一定知道~", INFO); 
          printtext("Q1:季陶樓是以政大創效時的教務主任命名，他的名字是？", QUESTION); 
          printtext("(A) 戴傳賢", ANSWER1);
          printtext("(B) 朱自清", ANSWER2);    
          printtext("(C) 周作人", ANSWER3);      
          correctAnswer = 1;
          break;   
      case 1:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("答錯了！來題簡單的...", INFO); 
          printtext("Q2:下列何者沒有當過政大駐校藝術家？", QUESTION); 
          printtext("(A) 林懷民", ANSWER1);
          printtext("(B) 余光中", ANSWER2);    
          printtext("(C) 吳念真", ANSWER3);      
          correctAnswer = 2;
          break; 
      case 2:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("又錯了！再給你一次機會...", INFO); 
          printtext("Q3:下列何者不屬於季陶樓？", QUESTION); 
          printtext("(A) 英語系", ANSWER1);
          printtext("(B) 歷史系", ANSWER2);    
          printtext("(C) 中文系", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 3:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("太誇張了！你確定是政大人嗎XDD", INFO); 
          printtext("Q4:最後一問：藝文中心一進去是幾樓？", QUESTION); 
          printtext("(A) 二樓", ANSWER1);
          printtext("(B) 三樓", ANSWER2);    
          printtext("(C) 四樓", ANSWER3);      
          correctAnswer = 3;
          break; 
      case 4:
           this.imgPath = "data/q-bg.png";           this.img = loadImage(imgPath);           image(this.img, 0, 0);
          printtext("什麼都不知道，Jones表示只能把你當掉了...", INFO); 
          printtext("Q5: 最後機會!! 藝文中心內部的便利商店是？", QUESTION); 
          printtext("(A) 7-11", ANSWER1);
          printtext("(B) 全家", ANSWER2);    
          printtext("(C) 萊爾富", ANSWER3);      
          correctAnswer = 3;
          break; 
    }
}
}
