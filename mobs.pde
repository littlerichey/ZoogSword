 class Mob {
  int type, x, y, dx, w;
  boolean die = false;
  boolean r = true;
  Mob(int type, boolean x) {
    this.type = type;
    if(x){
      this.x = 998;
    }else {
      this.x = 2;
    }
    dx = 20;
    y=135;
    w = 35;
  }

  void display() {
    dx = p1.kx;
    die();
    if (!die) {
      stroke(0);
      if (type == 1) {
        fill(0, 255, 0);
      } else if (type == 2) {
        fill(0, 0, 255);
      } else if (type == 3) {
        fill(255, 0, 0);
      }
      ellipse(x,y,w,w);
      line(x+w/4,y+w/2.25,x+w/4,height-40);
      line(x-w/4,y+w/2.25,x-w/4,height-40);
      if( x< width/2){
        x+= type;
        r=true;
      }else if (x>width/2){
        x -= type;
        r=false;
      }else {
        done = true;
      }
    }
  }

  void die() {
    if (!r){
      if (dx >= x-(w/2) && dx <= x+(w)) {
        x = 2000;
        score += type;
        die = true;
      }
    }else{
      if (dx >= x-(w) && dx <= x+(w/2)) {
        x = 2000;
        score += type;
        die = true;
      }
    }
    
  }
}