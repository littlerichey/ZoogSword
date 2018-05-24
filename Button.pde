class Button {
  int x, y, h, w;
  boolean over, isOp;
  String opVal;
  color b1 = color(0,255,0), b2 = color(255, 0,0), t1 = color(255), t2 = color(255);
  //standard
  Button(int x, int y) {
    this.x=x;
    this.y=y;
    w = 256;
    h = 10;
  }
  Button asOp(int w, int h, String opVal) {
    isOp = true;
    this.w=w;
    this.h=h;
    this.opVal=opVal;
    return this;
  }

  void hover() {
    if (mouseX<x+w && mouseX>x && mouseY<y+h && mouseY>y) {
      over= true;
    } else {
      over= false;
    }
  }
  void display() {
    hover();
    rectMode(CORNER);
    if(isOp) {
      textSize(30);
      textAlign(CENTER, CENTER);
      if (!over) {

        //rect
        stroke(0);
        fill(b1);
        rect(x, y, w, h);

        //text
        fill(t1);
        text(opVal, x+w/2, y+h/2-5);
      } else {
        stroke(0);
        fill(b2);
        rect(x, y, w, h );
        fill(t2);
        text(opVal, x+w/2, y+h/2-5);
      }
    }
  }
}
