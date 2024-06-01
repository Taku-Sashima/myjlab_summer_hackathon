import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

boolean right, left, waiting, dead;
int time;
float v;
PImage beachImg, pocali, player1, player2, sun1, sun2, waterPic, chiliPepper, saltPic, bed, sunlight, lie;
ItemStock waterStock, pocaliStock, saltStock;
Player player;

Minim minim;
ddf.minim.AudioPlayer soundPlayer;

final float WATER_AMOUNT_DECREASE = -0.04; // waterMeter.change() in myjlabSummerHackathon.pde
final float SALT_AMOUNT_DECREASE = -0.1;  // saltMeter.change() in player.pde, keyPressed() 

final float PLAYER_MOVEMENT_AMOUNT_FAST = 7.5; // player.move() in player.pde 
final float PLAYER_MOVEMENT_AMOUNT_SLOW = 4.5; // player.move() in player.pde 


// メーターのインスタンス
Meter saltMeter = new Meter(100, 100, 20, 50, 30, #E2FAD9);
Meter waterMeter = new Meter(100, 100, 20, 90, 30, #00B5FA);

//スタッキングリスト
StockingList stockingList = new StockingList(6);

void setup(){
  size(800,850);
  frameRate(200);
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  print(frameRate);
  
  dead = false;
  waiting = true;
  
  minim = new Minim(this);
  //player = minim.loadFile("./sound/punch.mp3");

  
  
  
  //背景画像
  beachImg = loadImage(sketchPath("image/beach.jpg"));
  
  //落下物の画像
  sun1 = loadImage(sketchPath("image/sun1.png"));
  sun2 = loadImage(sketchPath("image/sun2.png"));
  chiliPepper = loadImage(sketchPath("image/chiliPepper.png"));
  bed = loadImage(sketchPath("image/bed.png"));
  waterPic = loadImage(sketchPath("image/water.png"));
  pocali = loadImage(sketchPath("image/pocali.png"));
  saltPic = loadImage(sketchPath("image/salt.png"));
  
  //プレーヤー画像
  player1 = loadImage(sketchPath("image/player1.png"));
  player2 = loadImage(sketchPath("image/player2.png"));
  
  //ゲームオーバー画像
  sunlight = loadImage(sketchPath("image/sunlight.jpg"));
  lie = loadImage(sketchPath("image/lie.png"));
  
  //プレーヤーインスタンス
  player = new Player(400, 700, 50, player1);

  droppingItems.add(new DroppingItem("sun1", true, -30, -20, sun1));
  droppingItems.add(new DroppingItem("sun2", true, -30, -20, sun2));
  droppingItems.add(new DroppingItem("chiliPeper", true, -20, 0, chiliPepper));
  droppingItems.add(new DroppingItem("bed", true, 40, 40, bed));
  droppingItems.add(new DroppingItem("water",false, 20, 0, waterPic));
  droppingItems.add(new DroppingItem("pocali", false, 10, 10, pocali));
  droppingItems.add(new DroppingItem("salt", false, 0, 20, saltPic));
  
  //アイテムストックのインスタンス
  waterStock = new ItemStock(droppingItems.get(4).name, droppingItems.get(4).water, droppingItems.get(4).salt,0, waterPic);
  pocaliStock = new ItemStock(droppingItems.get(5).name, droppingItems.get(5).water, droppingItems.get(5).salt, 0, pocali);
  saltStock = new ItemStock(droppingItems.get(6).name, droppingItems.get(6).water, droppingItems.get(6).salt,0, saltPic);
  
  
  
  
}

void draw(){
  waiting();

  
}

void gameScreen(){
  time += 3;
  background(0);
  // decrease salt by time 
  waterMeter.change(WATER_AMOUNT_DECREASE);
  
  //背景
  image(beachImg,0,0,width,height);
  
  //落下物の生成、動き
  geneDropping();
  moveDropping();
  
  //プレイヤーの描画、動き
  player.display();
  player.move();
  
  //衝突感知
  collisionDetect();
  
  //メーターの描画
  waterMeter.display();
  saltMeter.display();
  
  // 
  String strwater= String.valueOf((int)waterMeter.val);
  String strsalt= String.valueOf((int)saltMeter.val);
  fill(#000000);
  textSize(25);
  text("salt:" + strsalt, 230,70);
  text("water:" + strwater, 230, 120);
  
  //所持アイテムの表示
  //waterStock.display();
  //pocaliStock.display();
  //saltStock.display();
  
  stockingList.displayStockingItems();
  
  textSize(50);
  text(String.valueOf((int)time/10), 730,50);
}
