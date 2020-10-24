/* 
 Scene 2 is an image created in photoshop.
 */

class Scene2 {

  PImage scene2;
  PImage poster;
  boolean posterclicked;

  Scene2() {
    scene2 = loadImage("data/img/scene2.png");
    poster = loadImage("data/img/poster.png");
  }

  void display() {
    image(scene2, 0, 0, 1000, 750);
    image(poster, width/2-30, 120, 70, 100);
  }

  void posterClick(int pointerX, int pointerY) {
    if (pointerX>width/2-30 && pointerX<width/2+40 && pointerY>120 && pointerY<220) {
      posterclicked = true;
    } else {
      posterclicked = false;
    }
  }

  void posteRelease() {
    posterclicked = false;
  }

  boolean posterClickres() {
    return posterclicked;
  }
}
