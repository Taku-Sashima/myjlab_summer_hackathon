
class StockingList {
    ArrayList<String> arr = new ArrayList<>();
    int maxNum;

    StockingList(int maxNum){
        this.maxNum = maxNum;
    }
    void removeItem(String itemName){
        arr.remove(arr.indexOf(itemName));
        printArr();
    }

    boolean pushItem(String itemName){
        if (arr.size() < maxNum){
            arr.add(itemName);
            printArr();
            return true;
        } else {
            return false;
        }
    }
    
    void displayStockingItems(){
      for (int i=0; i<this.arr.size(); i++){
        image(string2Pimage(this.arr.get(i)), 5+i*25, 7, 35,35);
      }
    }
    
    PImage string2Pimage(String n){
      PImage ret=pocali;
      switch (n){
        case "pocali":
          ret = pocali;
          break;
        case "salt":
          ret =  saltPic;
          break;
        case "water":
          ret = waterPic;  
          break;
      }
      return ret;
    }
    
    void printArr(){
      for(int i=0; i<this.arr.size(); i++){
        print(this.arr.get(i) + " ");
      }
      print("\n");
    }
}
