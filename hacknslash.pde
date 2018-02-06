int r = 50, g = 200, b = 255, score= 0, l = 1, h = 8, i = 0, t, tt, u; //<>//
float frames = 0;
boolean day = true, done = false, p;
Mob m[] = new Mob[100000000];
P1 p1 = new P1(450, 550, color(0));
void setup() {
  size(1000, 200);
  background(75, 200, 255);
  frameRate(20);
}

void draw() {
    if (!done) {
    background(r, g, b);
    frames += 1;
    if (frames/13 == int(frames/13)) {
      if (day) {
        r -= 1;
        g-= 3;
        b-= 3;
        if (r <= 0) {
          day = false;
          h += 1;
        }
      } else {
        r+= 1;
        g+= 3;
        b+= 3;
        if (b >= 255) {
          day = true;
          h += 1;
        }
      }
    }
    rectMode(CORNER);
    noStroke();
    fill(120, 69, 19);
    rect(0, height-30, width, 30);
    fill(34, 150, 34);
    rect(0, height-40, width, 10);
    rectMode(CENTER);
    fill(0);
    rect(width/2, height/1.5, 50, 53);
    fill(255);
    ellipse(width/2, height/2.2, 33, 33);
    textSize(30);
    text(score, 5, 25);
    p1.display();
    if (frames/30 == int(frames/30)) {
      tt = int(random(l, h));
      if (tt >= 8) {
        t = 3;
      } else if (tt >= 4) {
        t = 2;
      } else {
        t = 1;
      }
      if (int(random(1, 2.5)) == 2) {
        p = true;
      } else {
        p = false;
      }
      m[i] =new Mob(t, p);
      i++;
    }
    for (int d = 0; d<i; d++) { 
      m[d].display();
    }
  } else {
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER, TOP);
    text("Game Over" + "\n Score: " +score, width/2, 10);
  }
}