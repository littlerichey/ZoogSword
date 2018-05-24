import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ZoogSword extends PApplet {

int r = 50, g = 200, b = 255, score= 0, l = 3, h = 8, i = 0, t, tt, u, sr=0, sb=0, sg=0; //<>//
float frames = 0;
boolean day = true, done = false, p, pick = true, start = false;
Mob m[] = new Mob[100000000];
P1 p1;
Button red = new Button(10, 100);
Button green = new Button(10, 120);
Button blue = new Button(10, 140);
Button go = new Button(275, 100).asOp(50, 50, "Go");
int shirt = color(sr,sb,sg);
public void setup() {
  
  surface.setResizable(true);  
  background(255);
  frameRate(40);
}

public void draw() {
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
    if (frames/13 == PApplet.parseInt(frames/13)) {
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
    rect(width/2, height/1.5f, 50, 53);
    fill(255);
    ellipse(width/2, height/2.2f, 33, 33);
    textAlign(LEFT, CENTER);
    textSize(30);
    text(score, 5, 25);
    p1.display();
    if (frames/50 == PApplet.parseInt(frames/50)) {
      tt = PApplet.parseInt(random(l, h));
      t = tt/3;
      if (PApplet.parseInt(random(1, 2.7f)) == 2) {
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
class Button {
  int x, y, h, w;
  boolean over, isOp;
  String opVal;
  int b1 = color(0,255,0), b2 = color(255, 0,0), t1 = color(255), t2 = color(255);
  //standard
  Button(int x, int y) {
    this.x=x;
    this.y=y;
    w = 256;
    h = 10;
  }
  public Button asOp(int w, int h, String opVal) {
    isOp = true;
    this.w=w;
    this.h=h;
    this.opVal=opVal;
    return this;
  }

  public void hover() {
    if (mouseX<x+w && mouseX>x && mouseY<y+h && mouseY>y) {
      over= true;
    } else {
      over= false;
    }
  }
  public void display() {
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

  public void display() {
    dx = p1.kx;
    die();
    if (!die) {
      stroke(0);

      fill(red, g, b);
      ellipse(x, y, w, w);
      line(x+w/4, y+w/2.25f, x+w/4, height-40);
      line(x-w/4, y+w/2.25f, x-w/4, height-40);
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

  public void die() {
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
class P1 {
  int l1, l2, x, y, kx, kx2, t = 0, ti = 1;
  int c;
  boolean right = false, up = false, ld, rd;
  P1 (int l1, int l2, int c) {
    keyCode=1;
    this.l1 = l1;
    this.l2 = l2;
    this.x = l1;
    this.c = c;
    y = 134;
    kx=5;
  }

  public void display() {
    kx=5;
    kx2=5;
    move();
    zoog(x, y, c);
  }

  public void zoog(float x, float y, int grey) {
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
  public void move() {
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
  public void settings() {  size(335,160); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ZoogSword" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
