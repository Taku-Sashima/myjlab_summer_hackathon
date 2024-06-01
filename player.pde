
class Player{
  float x, y, rad;
  PImage picture;
  
  Player(float x,float y,float rad, PImage picture){
    this.x = x;
    this.y = y;
    this.rad = rad;
    this.picture = picture;
  }
  
  void display(){
    surround();
    // change player
    if(isHalfMeter()){
      this.picture = player2;
    }else{
      this.picture = player1;
    }
    image(this.picture,x,y,120,140);
  }
  
  
  void move(){
    float val = 0;
    if(isHalfMeter()){
      val = PLAYER_MOVEMENT_AMOUNT_SLOW;
    }else{
      val = PLAYER_MOVEMENT_AMOUNT_FAST;
    }
    if(right){x += val;}
    if(left){x -= val;}
  }
  
  void surround(){
    if(x<20){x = 20;}
    if (x>680){x = 680;}
  }

}

// whether either meter's value is half of itself
boolean isHalfMeter(){
   if(saltMeter.val < saltMeter.maxVal/2.0){
     return true;  
   }
   if(waterMeter.val < waterMeter.maxVal/2.0){
     return true;
   }
   return false;
}




//キーボードが押された時呼び出される:矢印キーそれぞれ押されていたらtrue
void keyPressed(){
  print(keyCode);
  saltMeter.change(SALT_AMOUNT_DECREASE);
  if(keyCode==39){
    right=true;
  }
  if(keyCode==37){
    left=true;
  }
  //アイテムを使う時に呼び出される関数
  if(keyCode==70 && waterStock.quantity >0){
    waterStock.discrease();
  }
  if(keyCode==68 && pocaliStock.quantity >0){
    pocaliStock.discrease();
  }
  if(keyCode==83 && saltStock.quantity >0){
    saltStock.discrease();
  }
  if(keyCode==32){
    waiting = false;
  }
}

//キーボードが離れた時呼び出される:矢印キーそれぞれ押されていたらfalse
void keyReleased(){
  if(keyCode==39){
    right=false;
  }
  if(keyCode==37){
    left=false;
  }
}
