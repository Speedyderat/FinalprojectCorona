//Scene 2 is an image created in photoshop.

class scene3 {
  PImage scene3;

  scene3() {
    scene3 = loadImage("img/scene3.png");
  }

  void display() {
    image(scene3, 0, 0, 1000, 750);
  }
}
