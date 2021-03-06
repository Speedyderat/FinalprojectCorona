/* 
 This is a class that creates NPCs.
 */

class NPC {

  float x, y, speed, L, updown, legSpeed, directionX, directionY, distNPC;
  color bodyColor;

  NPC() {
    rectMode(CENTER);

    x = random(380, 950);
    y = random(180, 700);
    speed = random(0.75, 1);
    L = 0;
    updown = 1;
    legSpeed = 0.35;
    directionX = random(1)>0.5?-1:1;    //checks remainder to determine the direction
    directionY = random(1)>0.5?-1:1;

    bodyColor = color(255, 255, 0);
  }


  void display() {
    walking();
    noStroke();
    fill(bodyColor);

    //player

    //body
    rect(x, y, 30, 50);

    //head
    ellipse(x, y-42, 30, 30);

    //left arm
    arc(x-16, y-16, 16, 16, PI, PI+HALF_PI);
    rect(x-20, y-4, 8, 30);
    arc(x-20, y+11, 8, 10, 0, PI);

    //right arm
    arc(x+16, y-16, 16, 16, PI+HALF_PI, TWO_PI);
    rect(x+20, y-4, 8, 30);
    arc(x+20, y+11, 8, 10, 0, PI);

    //left leg
    arc(x-10, y+(35 + L), 10, 10, PI, 2*PI);
    rect(x-10, y+(35 + L), 10, 40);
    arc(x-10, y+(55 + L), 10, 10, 0, PI);

    //right leg
    arc(x+10, y+(35 - L), 10, 10, PI, 2*PI);
    rect(x+10, y+(35 - L), 10, 40);
    arc(x+10, y+(55 - L), 10, 10, 0, PI);
  }

  void walking() {

    x = x + (speed * directionX);
    y = y + (speed * directionY);
    if (x > width - 20 || x < 20) {
      directionX *= -1;
    }

    if (y > height - 60 || y < 180) {
      directionY *= -1;
    }

    L = L + (legSpeed * updown);
    if (L >= 5 || L <= -5) {              //when L reaches the maximum (5) or the minimum (-5) it changes form going up to down or down to up
      updown *= -1;
    }
  }

  void infectedBy() {
    if (dist(P1.posX(), P1.posY(), x, y) < 150) {        //when Player and NPC are to close to each other you lose the game
      stage = gameover;
    }
  }
}
