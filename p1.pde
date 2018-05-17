class P1 {
  int l1, l2, x, y, kx, kx2, t = 0, ti = 1;
  color c;
  boolean right = false, up = false, ld, rd;
  P1 (int l1, int l2, color c) {
    keyCode=1;
    this.l1 = l1;
    this.l2 = l2;
    this.x = l1;
    this.c = c;
    y = 134;
    kx=5;
  }

  void display() {
    kx=5;
    kx2=5;
    move();
    zoog(x, y, c);
  }

  void zoog(float x, float y, color grey) {
    kx = 20000;
    ellipseMode(CENTER);
    rectMode(CENTER);
    stroke(0);
    fill(grey);
    rect(x, y, 14, 30);
    stroke(0);
    fill(255); 
    ellipse(x, y-20, 20, 20);
    fill(0);
    ellipse(x-5, y-20, 4, 8);
    ellipse(x+5, y-20, 4, 8);
    stroke(0);
    line(x-7, y+15, x-10, y+25);
    line(x+7, y+15, x+10, y+25);
    if (right && up) {
      stroke(0);
      line(x-7, y-7, x-14, y);
      line(x+7, y-7, x+14, y);
      noStroke();
      rect(x+15, y, 2, 6);
      rect(x+15, y-2, 6, 2);
      rect(x+15, y-8, 4, 10);
      triangle(x+13, y-13, x+15, y-16, x+17, y-13);
      kx = 100000;
    } else if (!right && up) {
      stroke(0);
      line(x-7, y-7, x-14, y);
      line(x+7, y-7, x+14, y);
      noStroke();
      rect(x-15, y, 2, 6);
      rect(x-15, y-2, 6, 2);
      rect(x-15, y-8, 4, 10);
      triangle(x-13, y-13, x-15, y-16, x-17, y-13);
      kx = 10000;
    } else if (right && !up) {
      stroke(0);
      line(x-7, y-7, x-14, y);
      line(x+7, y-7, x+14, y);
      noStroke();
      rect(x+17, y, 6, 2);
      rect(x+19, y, 2, 6);
      rect(x+25, y, 10, 4);
      triangle(x+33, y, x+30, y-2, x+30, y+2);
      kx = 583;
    } else if (!right && !up) {
      stroke(0);
      line(x-7, y-7, x-14, y);
      line(x+7, y-7, x+14, y);
      noStroke();
      rect(x-17, y, 6, 2);
      rect(x-19, y, 2, 6);
      rect(x-25, y, 10, 4);
      triangle(x-33, y, x-30, y-2, x-30, y+2);
      kx= 417;
    }
  }
  void move() {
    if (keyCode == 'd' || keyCode == 'D' || keyCode == RIGHT) {
      right = true;
      x = l2;
    } else if (keyCode == 'a' || keyCode == 'A' || keyCode == LEFT) {
      right = false;
      x = l1;
      
    }/* else if ((keyCode > 32 || keyCode < 32)) {
      up = false;
      t++;
      if (t>=4) {
        up = true;
        keyCode=1;
        t = 00;
      }
    } else {
      t += ti;
      if (t>=4) {
        up = false;
        ti *= -1;
      }else{
        up = true;
      }
    }*/
  }
}