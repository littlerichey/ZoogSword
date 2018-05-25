class Mob {
  int type, x, y, dx, w, speed, col;
  boolean die = false;
  boolean r = true;
  int red = 0, g = 0, b = 0;
  color c[] = new color[]{
color(0,255,0),
color(0,0,255),
color(255,0,0),
color(255,255,0),
color(255,0,255),
color(0,255,255),
color(255),
color(0,0,0),
color(255,150,0),
color(255,0,150),
color(0,255,150),
color(150,255,0),
color(150,0,255),
color(0,150,255),
color(255,150,150),
color(150,255,150),
color(150,150,255),
color(50),
color(100),
color(150),
color(200),
color(50,100,200),
color(100,200,50),
color(200,50,100),
color(50,200,100),
color(100,50,200),
color(200,100,50),};
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
    col = type;
    col-=1;
    while(col>=c.length){
      col-=c.length;
    }
  }

  void display() {
    dx = p1.kx;
    die();
    if (!die) {
      stroke(0);

      fill(c[col]);
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
