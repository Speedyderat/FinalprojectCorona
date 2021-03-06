/* 
 This class is for the energybar at the right bottom of the screen.
 */


class Energy {

  float energy, drain, charge, speed, tempRun;

  Energy() {
    energy = 197;            //197 is the maximum energy (bar is filled up)
    drain = 1;
    charge = 0.2;
  }

  void display() {
    drain();                  //calls method drain
    charge();                 //calls method charge
    stroke(0);
    strokeWeight(3);

    //iconbox
    fill(180);
    rect(750, 700, 50, 50);

    //energybox
    fill(255);
    rect(875, 700, 200, 50);

    //icon
    pushMatrix();
    translate(750, 700);

    noStroke();
    fill(255, 255, 0);
    triangle(-10, 3, 3, -20, 3, 3);
    triangle(10, -3, -3, 20, -3, -3);
    popMatrix();

    //energy
    rectMode(CORNER);

    pushMatrix();
    translate(777, 677);
    fill(128, 255, 0);
    rect(0, 0, energy, 47);
    popMatrix();

    rectMode(CENTER);
  }

  void charge() {
    if (energy <= 197) {          //refills the energybar to max energy
      energy = energy + charge;
    }
  }

  void drain() {
    if (keys [' '] && (keys ['a'] || keys ['s'] || keys ['d'] || keys ['w']) && speed == 2) {
      if (energy >= 0) {                                                                                //drains the energybar when W, A, S or D is pressed
        energy = energy - drain;
      }
    }
  }

  float noRunning() {
    if (energy <= 0) {
      speed = 1;
    } else if (speed == 1 && energy <= 100) {
      speed = 1;
    } else {
      speed = 2;
    }
    return speed;
  }

  void walkPressed(int selectedKey) {
      keys[selectedKey] = true;
  }

  void walkReleased(int selectedKey) {
    keys[selectedKey] = false;
  }
}
