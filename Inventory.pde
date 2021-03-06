/* 
 This inventory is created to store the grocerybag. (the bag has been made by ourselfs in photoshop.)
 */

class Inventory {

  PImage bag, bagEmpty;
  boolean shopped;

  Inventory() {
    bag = loadImage("data/img/bag.png");
    bagEmpty = loadImage("data/img/bagempty.png");
    shopped = false;
  }

  void display() {
    housechecker();                          //checks if you are on the home doormat
    shopchecker();                           //checks if you are on the shop doormat
    if (shopped) {                           //if you visited the shop shopped will be true and an shopping bag image will be shown in the corner
      image(bag, 50, 600, 80, 140);
    } else {
      image(bagEmpty, 50, 600, 80, 140);
    }
  }

  void housechecker() {
    if (stage == 2 && shopped == true) {
      if (dist(P1.posX(), P1.posY(), 200, 200) < 25) {
        stage = youwon;
      }
    }
  }

  boolean shopchecker() {
    if (stage == 4) {
      if (dist(P1.posX(), P1.posY(), 425, 250) < 50) {
        shopped = true;
      }
    }
    return shopped;
  }
}
