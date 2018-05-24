int r = 50, g = 200, b = 255, score= 0, l = 3, h = 8, i = 0, t, tt, u, sr=0, sb=0, sg=0; //<>//
float frames = 0;
boolean day = true, done = false, p, pick = true, start = false;
Mob m[] = new Mob[100000000];
P1 p1;
Button red = new Button(10, 100);
Button green = new Button(10, 120);
Button blue = new Button(10, 140);
Button go = new Button(275, 100).asOp(50, 50, "Go");
color shirt = color(sr,sb,sg);
void setup() {
  size(335,160);
  surface.setResizable(true);  
  background(255);
  frameRate(40);
}

void draw() {
  if (pick) {
    if (start) {
      p1 = new P1(450, 550, shirt);
      surface.setSize(1000, 200);
      pick = false;
    }else{
      rectMode(CORNER);
      red.display();
      green.display();
      blue.display();
      go.display();
      noStroke();
      fill(shirt);
      rect(0,0,width,90);
      fill(255-sr,255-sg,255-sb);
      text("Pick Your Hero's Color",width/2,45);
      for(int i = 0; i<=255; i++){
        fill(i,0,0);
        rect(i+10,100,1,10);
        fill(0,i,0);
        rect(i+10,120,1,10);
        fill(0,0,i);
        rect(i+10,140,1,10);
      }
      if(mousePressed){
        if(red.over){
          sr = mouseX-10;
        }
        if(green.over){
          sg = mouseX-10;
        }
        if(blue.over){
          sb = mouseX-10;
        }
        if(go.over){
         start = true;
        }
      }
      shirt = color(sr,sg,sb);
    }
  } else if (!done) {
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
          if (h%6 ==0) {
            l+=3;
          }
        }
      } else {
        r+= 1;
        g+= 3;
        b+= 3;
        if (b >= 255) {
          day = true;
          h += 1;
          if (h%6 ==0) {
            l+=3;
          }
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
    textAlign(LEFT, CENTER);
    textSize(30);
    text(score, 5, 25);
    p1.display();
    if (frames/50 == int(frames/50)) {
      tt = int(random(l, h));
      t = tt/3;
      if (int(random(1, 2.7)) == 2) {
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
