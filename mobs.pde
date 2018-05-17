class Mob {
  int type, x, y, dx, w, speed;
  boolean die = false;
  boolean r = true;
  int red = 0, g = 0, b = 0; 
  Mob(int type, boolean x) {
    this.type = type;
    if (x) {
      this.x = 998;
    } else {
      this.x = 2;
    }
    dx = 20;
    y=135;
    w = 35;
    speed = type;
    while (type>=0) {
      if (type%3 == 1) {
        g += 255;
      } else if (type%3 == 2) {
        b += 255;
      } else if (type%3 == 0) {
        red += 255;
      }
      type-=4;
    }
  }

  void display() {
    dx = p1.kx;
    die();
    if (!die) {
      stroke(0);

      fill(red, g, b);
      ellipse(x, y, w, w);
      line(x+w/4, y+w/2.25, x+w/4, height-40);
      line(x-w/4, y+w/2.25, x-w/4, height-40);
      if ( x< width/2-6) {
        x+= speed;
        r=true;
      } else if (x>width/2+6) {
        x -= speed;
        r=false;
      } else {
        done = true;
      }
    }
  }

  void die() {
    if (!r) {
      if (dx >= x-(w/2) && dx <= x+(w)) {
        x = 2000;
        score += type;
        die = true;
      }
    } else {
      if (dx >= x-(w) && dx <= x+(w/2)) {
        x = 2000;
        score += type;
        die = true;
      }
    }
  }
}