int r = 50, g = 200, b = 254, score= 0, l = 3, h = 8, i = 0, t, tt, u, sr=0, sb=0, sg=0, freq =50, frames = 0; //<>//
boolean day = true, done = false, p, pick = true, start = false;
ArrayList<Mob> m = new ArrayList();
P1 p1;
Button red = new Button(10, 100);
Button green = new Button(10, 120);
Button blue = new Button(10, 140);
Button go = new Button(275, 100).asOp(50, 50, "Go");
Button replay = new Button(450, 100).asOp(100, 50, "Replay");
color shirt = color(sr, sb, sg);
void setup() {
  size(335, 160);
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
    } else {
      rectMode(CORNER);
      red.display();
      green.display();
      blue.display();
      go.display();
      noStroke();
      fill(shirt);
      rect(0, 0, width, 90);
      fill(255-sr, 255-sg, 255-sb);
      text("Pick Your Hero's Color", width/2, 45);
      for (int i = 0; i<=255; i++) {
        fill(i, 0, 0);
        rect(i+10, 100, 1, 10);
        fill(0, i, 0);
        rect(i+10, 120, 1, 10);
        fill(0, 0, i);
        rect(i+10, 140, 1, 10);
      }
      if (mousePressed) {
        if (red.over) {
          sr = mouseX-10;
        }
        if (green.over) {
          sg = mouseX-10;
        }
        if (blue.over) {
          sb = mouseX-10;
        }
        if (go.over) {
          start = true;
        }
      }
      shirt = color(sr, sg, sb);
    }
  } else if (!done) {
    background(r, g, b);
    frames ++;
    if (frames%8 == 0) {
      if (frames%600 == 0) {
        h += 1;
        if (h%6 ==0) {
          l+=3;
          freq--;
          println("freq: " + freq);
        }
      }
      if (day) {
        if (frames%24==0) {
          r -= 1;
        }
        g-= 1;
        b-= 1;
        if (r <= 0) {
          day = false;
        }
      } else {
        if (frames%24==0) {
          r += 1;
        }
        g+= 1;
        b+= 1;
        if (r >= 50) {
          day = true;
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
    if (frames%freq == 0) {
      println(frames-tt);
      tt = int(random(l, h));
      t = tt/3;
      tt = frames;
      if (int(random(2))%2 == 0) {
        p = true;
      } else {
        p = false;
      }
      m.add(new Mob(t, p));
      i++;
    }
    for (int d = 0; d<i; d++) {
      if (m.get(d).die) {
        m.remove(d);
        i--;
      }
      if (m.size()>d) {
        m.get(d).display();
      }
    }
  } else {
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER, TOP);
    text("Game Over" + "\n Score: " +score, width/2, 10);
    replay.display();
    if (mousePressed && replay.over) {
      r = 50; 
      g = 200; 
      b = 254; 
      score= 0; 
      l = 3; 
      h = 8; 
      i = 0; 
      sr=0; 
      sb=0; 
      sg=0; 
      freq =50;
      frames = 0;
      day = true; 
      done = false; 
      pick = true; 
      start = false;
      m.clear();
      surface.setSize(335, 160);
      background(255);
    }
  }
}
