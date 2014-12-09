import de.looksgood.ani.*;
import oscP5.*;

OscP5 oscP5;

//Animation1 Globals
float radius = 0;
color b1, b2;
float radiusSqr = 0;
float radiusFan = 0; //this controls the fanning animation for the squares, it takes values from 0 to 1
int counter = 1;

//Animation2 Gloabls - see Fireworks.pde for more consise code
float inradius1 = 10;
float difference1 = 1;
int strokeopacity1 = 100;

float inradius2 = 10;
float difference2 = 1;
int strokeopacity2 = 100;

float front = 0;
float back = 0;
int strokeopacity3 = 255;

boolean tester = false;

int T = 0;


//Animation3 Globals
float radiusdiamond = 0;
float radiusdiamond1 = 0;
float radiusdiamond2 = 0;
int rotationdiamond = 0;
float radiusdiamond3 = 0;
float radiusdiamond4 = 0;
float radiusdiamond5 = 0;
int strokeopacity4 = 255;

boolean test = false;

//Animation4
boolean tester1 = false;
float ani4radius;
float ani4opacity;
float ani4rotate;

//Animation5
boolean tester2 = false;
float rectwidth;
float rectheight;

int key1, key2, key3, key4, key5, key6;
int bgcR = 0;
int bgcG = 0;
int bgcB = 0;
int bgcRline;
int bgcGline;
int bgcBline;



void setup() {
  size(500, 500);
  smooth();

  //Define BG colors
  b1 = color(0);
  b2 = color(76, 27, 27);

  //Always call Ani.init()
  Ani.init(this);

  //Setup OSC Port too look for data over a particular port
  oscP5 = new OscP5(this, 12000);
}

void draw() {
  //Background
  background(bgcR,bgcG,bgcB);
  
  //Animation5
  if (mousePressed) {
    if (tester2 == false) {
      tester2 = true;
      //intial arguments
      rectwidth = 1;
      rectheight = 1;
      //animations
      float angle = atan2(height, width);
      println(cos(angle));
      Ani.to(this, .8, "rectwidth", width*cos(angle)*2, Ani.EXPO_IN);
      Ani.to(this, .8, .9, "rectheight", height*sin(angle)*2, Ani. SINE_IN, "onEnd:changebgcolor");
      
    }
  }

  //Animation3
  if (test == true) {
    noStroke();
    strokeopacity4 = 140;
    fill(250, 250, 250, strokeopacity4);
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/4);
    rectMode(CENTER);
    rect(0, 0, radiusdiamond, radiusdiamond);
    rect(0, 0, radiusdiamond*1.25, radiusdiamond*1.25);
    fill(0, 0, 0);
    rect(0, 0, radiusdiamond3, radiusdiamond3);


    pushMatrix();
    rotate(PI/4);
    //Animation Control radiusdiamond1 & radiusdiamond4
    for (int i=0; i<5; i++) {
      fill(250, 250, 250, strokeopacity4);
      rect(radiusdiamond1*2, radiusdiamond1*2, radiusdiamond1, radiusdiamond1);
      fill(0, 0, 0);
      rect(radiusdiamond1*2, radiusdiamond1*2, radiusdiamond4, radiusdiamond4); 
      rotate(PI*(i)/2);
    }
    popMatrix();

    for (int i=0; i<5; i++) {
      fill(250, 250, 250, strokeopacity4);
      rect(radiusdiamond*cos(PI/4)-5, radiusdiamond*sin(PI/4)-5, radiusdiamond1, radiusdiamond1);
      fill(0, 0, 0);
      rect(radiusdiamond*cos(PI/4)-5, radiusdiamond*sin(PI/4)-5, radiusdiamond4, radiusdiamond4);
      rotate(PI*i/2);
    }
    pushMatrix();
    rotate(rotationdiamond*PI/80);
    for (int i=0; i<5; i++) {
      fill(250, 250, 250, strokeopacity4);
      rect(radiusdiamond*cos(PI/4)+10, radiusdiamond*sin(PI/4)+10, radiusdiamond2, radiusdiamond2);
      fill(0, 0, 0);
      rect(radiusdiamond*cos(PI/4)+10, radiusdiamond*sin(PI/4)+10, radiusdiamond5, radiusdiamond5);
      rotate(PI*i/2);
    }
    popMatrix();

    popMatrix();
  }

  if (key3 == 1) {
    if (test == false) {

      radiusdiamond5 = 0;
      radiusdiamond3 = 0;
      radiusdiamond = 0;
      radiusdiamond1 = 0;
      radiusdiamond2 = 0;
      rotationdiamond = 0;
      radiusdiamond4 = 0;
      radiusdiamond5 = 0;
      test = true;
      Ani.to(this, 2, "strokeopacity4", 0, Ani.CUBIC_OUT);
      Ani.to(this, 1, "rotationdiamond", 80, Ani.BOUNCE_IN_OUT);
      Ani.to(this, 1.2, "radiusdiamond", 100, Ani.BACK_OUT);
      Ani.to(this, 1.5, .5, "radiusdiamond3", 140, Ani.EXPO_OUT);

      Ani.to(this, 1, .15, "radiusdiamond1", 30, Ani.SINE_IN_OUT);
      Ani.to(this, .75, 1, "radiusdiamond4", 45, Ani.EXPO_OUT);

      Ani.to(this, 1, .2, "radiusdiamond2", 18, Ani.SINE_IN_OUT);
      Ani.to(this, .8, 1, "radiusdiamond5", 20, Ani.CUBIC_OUT, "onEnd:reseter");
    }
  }

  //Animation2
  strokeWeight(2);
  stroke(255, 255, 255, strokeopacity1);
  int numlines = 20;
  float ani2x = 2*width/3;
  float ani2y = width/3;
  if (tester==true) {
    T++;
    for (int i=0; i<numlines; i++) {
      pushMatrix();
      translate(ani2x, ani2y);
      float outradius1 = inradius1 + difference1;
      line(inradius1*cos(2*PI*i/numlines), inradius1*sin(2*PI*i/numlines), outradius1*cos(2*PI*i/numlines), outradius1*sin(2*PI*i/numlines));
      popMatrix();
    }

    stroke(255, 255, 255, strokeopacity2);
    for (int i=0; i<numlines; i++) {
      pushMatrix();
      translate(ani2x, ani2y);
      rotate(PI/4);
      float outradius2 = inradius2 + difference2;
      line(inradius2*cos(2*PI*i/numlines), inradius2*sin(2*PI*i/numlines), outradius2*cos(2*PI*i/numlines), outradius2*sin(2*PI*i/numlines));
      popMatrix();
    }

    pushMatrix();
    translate(ani2x, ani2y);
    rotate(-PI/2);
    noFill();
    stroke(255, 255, 255, strokeopacity3);
    arc(0, 0, 250, 250, back, front);
    popMatrix();

    if (T==1) {
      key2animation();
    }
  }
  if (key2==1) {
    tester = true;
  }

  //Animation 1
  noStroke();
  fill(255, 0, 0, 80);
  float elx = width/3;
  float ely = height/3;
  ellipse(elx, ely, radius, radius);

  noFill();
  strokeWeight(1);
  stroke(255, 0, 0, 120);
  if (radiusSqr == 0) { //keeps the one pixel off the screen caused by rect() when there is no width and height
    stroke(255, 0, 0, 0);
  }

  int numsquares = 7;
  for (int i = 0; i < numsquares; i++) {
    pushMatrix();
    translate(elx, ely);
    rotate(i*PI*radiusFan/(4*numsquares));
    rectMode(CENTER);
    rect(0, 0, radiusSqr, radiusSqr);
    popMatrix();
  }

  if (key1==1) {
    key1animation();
  }

  //Animation4
  if (tester1 == true) {
    strokeWeight(1);
    stroke(255, 255, 255, ani4opacity);
    pushMatrix();
    translate(width/2, height/2);
    rotate(ani4rotate);
    line(0, ani4radius, -ani4radius, 0);
    line(-ani4radius, 0, 0, -ani4radius);
    line(0, -ani4radius, ani4radius, 0);
    line(ani4radius, 0, 0, ani4radius);
    for (int i=0; i<4; i++) {
      noStroke();
      fill(255, 255, 255, ani4opacity*2);
      ellipse(0, ani4radius, 10, 10);
      rotate(PI/2);
    }
    popMatrix();
  }


  if (key4 == 1) {
    if (tester1 == false) {
      tester1 = true;
      ani4radius = 30;
      ani4opacity = 0;
      ani4rotate = random(0, PI);
      Ani.to(this, 1.5, "ani4radius", width, Ani.QUART_IN, "onEnd:resetani4");
      Ani.to(this, 1.5, "ani4rotate", 2*PI, Ani.CIRC_IN);
      Ani.to(this, .25, "ani4opacity", 155, Ani.QUINT_OUT, "onEnd:fader");
    }
  }

  //Animation5
  if (tester2 == true) {
    //newColorValues
    bgcRline = 100;
    bgcGline = 140;
    bgcBline = 20;
    noStroke();
    fill(255, 255, 255);
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/4);
    rectMode(CENTER);
    fill(bgcRline,bgcGline,bgcBline);
    rect(0, 0, rectwidth, rectheight);
    rectMode(CORNER);
    popMatrix();
  }

  
}

void key1animation() {

  //Animate1
  float at = .2; //at is short for animation time
  Ani.to(this, at, "radius", 100, Ani.SINE_IN_OUT, "onEnd:easeOutCirc");

  Ani.to(this, at*2, "radiusFan", 2, Ani.CIRC_IN_OUT, "onEnd:easeOutSquares");

  Ani.to(this, at*2, "radiusSqr", 120, Ani.CIRC_IN_OUT);
}


void key2animation() {
  //Animate2
  //reset globals
  inradius1 = 10;
  difference1 = 1;
  strokeopacity1 = 100;

  inradius2 = 10;
  difference2 = 1;
  strokeopacity2 = 100;

  front = 0;
  back = 0;

  tester = true;

  //fireworks out animation for outline lines
  Ani.to(this, .6, "inradius1", 120, Ani.SINE_IN_OUT);
  Ani.to(this, .3, "difference1", 20, Ani.QUAD_IN, "onEnd:fadeout1");
  //fireworks out animation for inline lines
  Ani.to(this, .5, .1, "inradius2", 120, Ani.SINE_IN_OUT);
  Ani.to(this, .2, .1, "difference2", 20, Ani.QUAD_IN, "onEnd:fadeout2");
  //cirlce line animation
  Ani.to(this, .4, "front", 2*PI, Ani.SINE_IN_OUT);
  Ani.to(this, .45, .3, "back", 2*PI, Ani.SINE_IN_OUT, "onEnd:outed");
}

//onEnds for key1Animation
void easeOutCirc() {
  Ani.to(this, .4, .3, "radius", 0, Ani.CIRC_IN_OUT);
}

void easeOutSquares() {
  Ani.to(this, .5, .2, "radiusFan", 0, Ani.CIRC_IN_OUT);
  Ani.to(this, .5, .5, "radiusSqr", 0, Ani.CIRC_IN_OUT);
}


//onEnds for key2Animation
void fadeout1() {
  Ani.to(this, .2, "difference1", 0, Ani.SINE_OUT);
  Ani.to(this, .2, "strokeopacity1", 0, Ani.CUBIC_IN);
}

void fadeout2() {
  Ani.to(this, .4, "difference2", 0, Ani.SINE_OUT);
  Ani.to(this, .4, "strokeopacity2", 0, Ani.CUBIC_IN);
}

void outed() {
  tester = false;
  T = 0;
}

//onEnds for key3Animation
void reseter() {
  test = false;
  strokeopacity4 = 140;
}

//onEnds for key4Animation
void fader() {
  Ani.to(this, .75, .5, "ani4opacity", 0, Ani.CIRC_IN);
}
void resetani4() {
  tester1 = false;
}
//onEnds for key5Animation
void changebgcolor() {
  bgcR = 100;
  bgcG = 140;
  bgcB = 20;
  tester2 = false;
}

void oscEvent(OscMessage m) {
  synchronized(this) {
    if (m.checkAddrPattern("/key1")) {
      key1 = (m.get(0).intValue());
    }
    if (m.checkAddrPattern("/key2")) {
      key2 = (m.get(0).intValue());
    }
    if (m.checkAddrPattern("/key3")) {
      key3 = (m.get(0).intValue());
    }
    if (m.checkAddrPattern("/key4")) {
      key4 = (m.get(0).intValue());
    }
    if (m.checkAddrPattern("/key5")) {
      key5 = (m.get(0).intValue());
    }
    if (m.checkAddrPattern("/key6")) {
      key6 = (m.get(0).intValue());
    }
  }
}

