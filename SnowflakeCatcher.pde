//Helen Zhang, Block 1, Snowflake Catcher
Snowflake [] snow = new Snowflake[15];
Player me = new Player();
void setup(){
  for(int i=0;i<snow.length;i++){
    snow[i]= new Snowflake();
  }
  textSize(50);
  size(600,400);
  noStroke();
}
void draw(){
  background(#343D66);
  in();
  me.show();
  me.move();
  for(int i=0;i<snow.length;i++){
    snow[i].show();
    snow[i].move();
    snow[i].wrap();
    snow[i].lookDown();
  }
  if(me.level==15){
    fill(200);
    text("D O N E",20,50);
    }
}

void in(){
  for(int i=0;i<snow.length;i++){
    if(snow[i].myY+3>=me.myY+15&&snow[i].myY-3<me.myY+20&&snow[i].myX-3>=me.myX-20&&snow[i].myX+3<=me.myX+20){
      snow[i].isMoving=false;
      if(snow[i].t==190){
        me.level+=1;
      }
    }
  }
}

class Snowflake{
  float myX,myY,speed,t;
  int countNum;
  boolean isMoving;
  Snowflake(){
    myX=(float)(Math.random()*601);
    myY=(float)(Math.random()*401);
    isMoving=true;
    t=200;
    speed=(float)(Math.random()*.5+.5);
  }
  void show(){
    if(isMoving==false){
      t-=10;
    }
    fill(200,200,200,t);
    ellipse(myX,myY,6,6);
  }
  void lookDown(){
  }
  void erase(){
    //Might not use
  }
  void move(){
    if(isMoving==true){
      myY+=speed;
    }
  }
  void wrap(){
    if(myY>406){
      myY=-6;
      myX=(float)(Math.random()*601);
    }
  }
}

class Player{
  float myX,myY,speedDir,a;
  int level;
  boolean right;
  Player(){
    myY=360;
    myX=300;
    speedDir=0;
    level=0;
  }
  void show(){
    fill(200);
    rect(myX-25,myY,50,20);
    fill(#343D66);
    rect(myX-20,myY,40,15);
    fill(157,222,218,50);
    rect(myX-20,myY+15-level,40,level);
  }
  void move(){
    if(key=='a'&&myX>50){
      speedDir=-2;
      if(a>speedDir){
        a-=.1;
      }
    }else if(key=='d'&&myX<550){
      speedDir=2;
      if(a<=speedDir){
        a+=.1;
      }
    }else{
      if(a>0){
        a-=.1;
      }else if(a<0){
        a+=.1;
      }
    }
    myX+=a;
  }
}