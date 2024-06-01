
void collisionDetect(){
  for(int i=0; i<dropping.size(); i++){
    if(abs(dropping.get(i).x-player.x)<70 && abs(dropping.get(i).y-player.y)<60){
      
      if(dropping.get(i).isSokuji){
        //即時関数
        saltMeter.change(dropping.get(i).salt);
        waterMeter.change(dropping.get(i).water);
        dropping.remove(i);
      }else{
        
        //保持する関数
        restore(i);
        
        dropping.remove(i);
      }
      
      //print("work");
    }
  }
}

void restore(int i){
  if(dropping.get(i).name == "pocali"){
    if(stockingList.pushItem("pocali")){
      pocaliStock.increase();
    }
  }else if(dropping.get(i).name == "water"){
    if(stockingList.pushItem("water")){
      waterStock.increase();
    }
  }else if(dropping.get(i).name == "salt"){
    if(stockingList.pushItem("salt")){
      saltStock.increase();
    }
  }
}

//Math.pow(dropping.get(i).x + 25 - player.x,2) + 
//    Math.pow(dropping.get(i).y + 25 - player.y,2) <= 
//    Math.pow(dropping.get(i).rad*0.5 + player.rad*0.5,2)
