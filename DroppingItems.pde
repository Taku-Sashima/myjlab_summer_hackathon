
ArrayList<DroppingItem> droppingItems = new ArrayList<DroppingItem>();

public class DroppingItem {
  String name;
  boolean isSokuji;
  float water, salt;
  PImage picture;

  DroppingItem(String name, boolean isSokuji, float water, float salt, PImage picture) {
      this.name = name;
      this.isSokuji = isSokuji;
      this.water = water;
      this.salt = salt;
      this.picture = picture;
  }
}
