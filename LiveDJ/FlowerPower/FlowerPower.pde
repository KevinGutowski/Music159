//Kevin Gutowski
//Friday April 11 2014
//A study of the golden ratio



import oscP5.*;

OscP5 oscP5;
//OSC variables
float bass;
float lowmid;
float midmid;
float highmid;
float high;
float peakampstream;
int past05 = 0;
int past06 = 0;
int past07 = 0;
int past08 = 0;
int past09 = 0;
int past10 = 0;
int past11 = 0;
int past12 = 0;
int past13 = 0;
int past14 = 0;
int past15 = 0;
int past16 = 0;
int past17 = 0;
int past18 = 0;
int past19 = 0;
int past20 = 0;
int past21 = 0;
int past22 = 0;
int sum = 0;


//Flower Variables
int c = 16;
float t = 1;
int nprime = 1;
int T=0;

//FlyingBoxes Variables
float my_num = 0;
int box_num = 100;
float [] Boxes = new float[box_num];
int [] Box_color = new int[box_num];
float tprime = 1;
float changer = .5;
color [] colors = { 
  color(34, 83, 120), color(22, 149, 163), color(172, 240, 242), color(243, 255, 226), color(235, 127, 0)
};

int [] kolor1 = {191,255,100};
int [] kolor2 = {191,44,85};
int [] kolor3 = {343,65,76};
int [] kolor4 = {139,25,88};
int [] kolor5 = {178,100,68};
int check = 0;

void setup() {
  size(displayWidth, displayHeight, P2D); 
  frameRate(45); 
  background(0);
  strokeWeight(1);
  stroke(255, 10);
  oscP5 = new OscP5(this, 12000);
  
  for (int i = 0; i < box_num; i++) {
      Boxes[i] = random(-width, width);
      Box_color[i] = int(random(0, 5));
  }
}


void draw() {
  println(t);
  rectMode(CORNER);
  noStroke();
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  t = t + .1;
  nprime++;
  
  pushMatrix();
  if (t < 100) {
    translate(width/t, height/t);
  }
  if (t > 500) {
    T++;
    translate(-T*5, T*3);
  }

  if (t < 520) {
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    fill(0, 0, 0, 30);
    rect(-width/2, -height/2, width, height);

    circles();
    sum = past05+past06+past07+past08+past09+past10+past11+past12+past13+past14+past15+past16+past17+past18+past19+past20+past21+past22+1;
    popMatrix();
  }
  popMatrix();
  
  
  int start_time = 508;
  if (t>=start_time) {
    pushMatrix();
    if (t <=start_time+30) {
    translate(width*map(t, start_time , start_time+30, 5,0),height*map(t, start_time , start_time+30, 5,0));
    }
    if (t>900) {
      translate(-width*map(t,900,950,0,1.5),-height*map(t,900,950,0,1.5));
    } else {
      translate(0,0);
    }
    if (t>940) {
      t=1;
      nprime=1;
    }
    fill(0, 0, 0, 120);
    rect(0, 0, width, height);
    tprime += changer;
    if ((tprime==100) || (tprime==1)) {
      changer = changer*-1;
      check++;
    }
    for (int i = 0; i<Boxes.length; i++) {
      pushMatrix();
      translate(width * noise(my_num + Boxes[i]/10), height * noise(my_num) + Boxes[i]);
      rotate(8* noise(20 + my_num)+ Boxes[i]/tprime);
      scale(sin(tprime/100)*4);
      float rectx = 15 * noise(30 + my_num)+bass*20;
      float recty = 15 * noise(30 + my_num)+bass*20;

      if (check%16<8) {
        //if boxes are outside of window + windowbuffer then don't draw them
        if ((recty>-40) || (recty<height+40)) {
          rectMode(CENTER);
          fill(0, 0, 0, 200);
          rect(-4, -4, rectx+10, recty+10);
          fill(colors[Box_color[i]], 240);
          rect(0, 0, 15 * noise(30 + my_num)+bass*20+10, 15 * noise(my_num)+bass*20+10);
          rectMode(CORNER);
        }
      } 
      else {
        //likewise if circles are out, throw em out!
        if ((recty>-40) || (recty<height+40)) {
          fill(0, 0, 0, 200);
          ellipse(-4, -4, 15 * noise(30 + my_num)+peakampstream*1.5+bass*2+10, 15 * noise(my_num)+peakampstream*1.5+bass*2+10);
          fill(colors[Box_color[i]], 240);
          ellipse(0, 0, 15 * noise(30 + my_num)+peakampstream*1.5+bass*2, 15 * noise(my_num)+peakampstream*1.5+bass*2+10);
        }
      }
      popMatrix();
    }
    popMatrix();
    my_num += 0.02;
  }
}
  void circles() {


    for (int n = 1; n < nprime*3; n++) {
      ;
      float r = c*sqrt(n)-2;
      float radius = 5;
      float theta = n*PI*(3-sqrt(5));
      float xfactor = 1;
      /*
    if (t%1000<500) {
       xfactor = (bass+lowmid*.012+highmid*.012+sum*sum*.3 + .00001*t%100);
       } else {
       xfactor = midmid*.022+lowmid*.022+highmid*.022+sum*.44*sum + .00001*t%100;
       }
       */
      xfactor = bass*4+lowmid*.012+2*(t/2)%100;
      colorMode(HSB);
      strokeWeight(2);
      /*
      if (n<nprime*3/4) {
        stroke(map(n, 1, nprime*3/4, kolor1[0], kolor2[0]), map(n, 1, nprime*3/4, kolor1[1], kolor2[1]), map(n, 1, nprime*3/4, kolor1[2], kolor2[2]), 200);
        fill(map(n, 1, nprime*3/4, kolor1[0], kolor2[0]), map(n, 1, nprime*3/4, kolor1[1], kolor2[1]), map(n, 1, nprime*3/4, kolor1[2], kolor2[2]), 150);
      } else if ((n>=nprime*3/4) && (n<nprime*3*2/4)) {
        stroke(map(n, nprime*3/4, nprime*3*2/4, kolor2[0], kolor3[0]), map(n, nprime*3/4, nprime*3*2/4, kolor2[1], kolor3[1]), map(n, nprime*3/4, nprime*3*2/4, kolor2[2], kolor3[2]), 200);
        fill(map(n, nprime*3/4, nprime*3*2/4, kolor2[0], kolor3[0]), map(n, nprime*3/4, nprime*3*2/4, kolor2[1], kolor3[1]), map(n, nprime*3/4, nprime*3*2/4, kolor2[2], kolor3[2]), 150);
      } else if ((n>=nprime*3*2/4) && (n<nprime*3*3/4)) {
        stroke(map(n, nprime*3*2/4, nprime*3*3/4, kolor3[0], kolor4[0]), map(n, nprime*3*2/5, nprime*3*3/4, kolor3[1], kolor4[1]), map(n, nprime*3*2/5, nprime*3*3/4, kolor3[2], kolor4[2]), 200);
        fill(map(n, nprime*3*2/4, nprime*3*3/4, kolor3[0], kolor4[0]), map(n, nprime*3*2/5, nprime*3*3/4, kolor3[1], kolor4[1]), map(n, nprime*3*2/5, nprime*3*3/4, kolor3[2], kolor4[2]), 150);
      } else if ((n>=nprime*3*3/4) && (n<=nprime*3*4/4)) {
        stroke(map(n, nprime*3*3/4, nprime*3*4/4, kolor4[0], kolor5[0]), map(n, nprime*3*3/4, nprime*3*4/4, kolor4[1], kolor5[1]), map(n, nprime*3*3/4, nprime*3*4/4, kolor4[2], kolor4[2]), 200);
        fill(map(n, nprime*3*3/4, nprime*3*4/4, kolor4[0], kolor5[0]), map(n, nprime*3*3/4, nprime*3*4/4, kolor4[1], kolor5[1]), map(n, nprime*3*3/4, nprime*3*4/4, kolor4[2], kolor4[2]), 150);
      }
      */
      //stroke(map(n, 1, nprime*3*10/4, kolor1[0], kolor2[0]), map(n, 1, nprime*3*4/4, kolor1[1], kolor2[1]), map(n, 1, nprime*3*4/4, kolor1[2], kolor2[2]), 200);
      fill(map(n, 1, nprime*3*10/4, kolor1[0], kolor2[2]), map(n, 1, nprime*3*4/4, kolor1[0], kolor2[0]), map(n, 1, nprime*3*4/4, kolor1[0], kolor2[0]), 100);
      noStroke();
      colorMode(RGB);
      float pulse = pow(sin(t*PI/3-n*PI/(map(xfactor, 0, 8, 0, 10))), 1.5);
      if ((r*cos(theta) < width*2+20) && (r*cos(theta) > -width*2-20) && (r*sin(theta) < height*2+20) && (r*sin(theta) > -height*2-20)) {
        ellipse(r*cos(theta)/4, r*sin(theta)/4, pulse*radius+sum+bass*.2+lowmid*.5+4, pulse*radius+sum+bass*.2+lowmid*.5+4);
      }
    }
  }

  /*
void mousePressed() {
   saveFrame("_##.jpg");
   println("saved new JPG!");
   }
   */

  void oscEvent(OscMessage m) {
    synchronized(this) {
      if (m.checkAddrPattern("/bass")) {
        bass = (m.get(0).floatValue())*5;
      }
      if (m.checkAddrPattern("/lowmid")) {
        lowmid = (m.get(0).floatValue())*10;
      }
      if (m.checkAddrPattern("/midmid")) {
        midmid = (m.get(0).floatValue())*10;
      }
      if (m.checkAddrPattern("/highmid")) {
        highmid = (m.get(0).floatValue())*10;
      }
      if (m.checkAddrPattern("/high")) {
        high = (m.get(0).floatValue())*10;
      }  
      if (m.checkAddrPattern("/past05")) {
        past05 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past06")) {
        past06 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past07")) {
        past07 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past08")) {
        past08 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past09")) {
        past09 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past10")) {
        past10 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past11")) {
        past11 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past12")) {
        past12 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past13")) {
        past13 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past14")) {
        past14 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past15")) {
        past15 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past16")) {
        past16 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past17")) {
        past17 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past18")) {
        past18 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past19")) {
        past19 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past20")) {
        past20 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past21")) {
        past21 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/past22")) {
        past22 = (m.get(0).intValue());
      }
      if (m.checkAddrPattern("/peakampstream")) {
        peakampstream = (m.get(0).floatValue());
      }
    }
  }

