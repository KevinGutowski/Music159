import oscP5.*;

OscP5 oscP5;

float bass;
float lowmid;
float midmid;
float highmid;
float high;

void setup() {
  background(100,50,120);
  size(500,500);
  oscP5 = new OscP5(this, 12000);
}

void draw() {
  float multiplier = 500;
  float circlesize = 500;
  float difference = 60;
  float smoothbass = bass;
  float smoothlowmid = lowmid;
  float smoothmidmid = midmid;
  float smoothhighmid = highmid;
  float smoothhigh = high;
  float smoothmulti = 0.1;
  fill(100,50,120,200);
  rect(0,0,width,height);
  noStroke();
  
  smoothbass += (bass - smoothbass) * smoothmulti;
  smoothlowmid += (lowmid - smoothlowmid) * smoothmulti;
  smoothmidmid += (midmid - smoothmidmid) * smoothmulti;
  smoothhighmid += (highmid - smoothhighmid) * smoothmulti;
  smoothhigh += (high - smoothhigh) * smoothmulti;
  
  fill(0,0,0,10);
  ellipse(width/2+3,height/2-4, smoothbass*multiplier+(circlesize-0*difference), smoothbass*multiplier+(circlesize-0*difference));
  fill(51,77,92,200);
  ellipse(width/2,height/2, smoothbass*multiplier+(circlesize-0*difference), smoothbass*multiplier+(circlesize-0*difference));
  
  fill(0,0,0,10);
  ellipse(width/2+3,height/2-4, smoothlowmid*multiplier+(circlesize-1*difference), smoothlowmid*multiplier+(circlesize-1*difference));
  fill(69,178,157,200);
  ellipse(width/2,height/2, smoothlowmid*multiplier+(circlesize-1*difference), smoothlowmid*multiplier+(circlesize-1*difference));
  
  fill(0,0,0,10);
  ellipse(width/2+3,height/2-4, smoothmidmid*multiplier+(circlesize-2*difference), smoothmidmid*multiplier+(circlesize-2*difference));
  fill(239,201,67,200);
  ellipse(width/2,height/2, smoothmidmid*multiplier+(circlesize-2*difference), smoothmidmid*multiplier+(circlesize-2*difference));
  
  fill(0,0,0,10);
  ellipse(width/2+3,height/2-4, smoothhighmid*multiplier+(circlesize-3*difference), smoothhighmid*multiplier+(circlesize-3*difference));
  fill(226,122,63,200);
  ellipse(width/2,height/2, smoothhighmid*multiplier+(circlesize-3*difference), smoothhighmid*multiplier+(circlesize-3*difference));
  
  fill(0,0,0,10);
  ellipse(width/2+3,height/2-4, smoothhigh*multiplier+(circlesize-4*difference), smoothhigh*multiplier+(circlesize-4*difference));
  fill(223,90,73,200);
  ellipse(width/2,height/2, smoothhigh*multiplier+(circlesize-4*difference), smoothhigh*multiplier+(circlesize-4*difference));
  
}
 
void oscEvent(OscMessage m) {
  println(m.addrPattern());
  println(m.arguments());
  synchronized(this) {
    if(m.checkAddrPattern("/bass")) {
      bass = (m.get(0).floatValue())*5;
      }
    if(m.checkAddrPattern("/lowmid")) {
      lowmid = (m.get(0).floatValue())*10;
      }
    if(m.checkAddrPattern("/midmid")) {
      midmid = (m.get(0).floatValue())*10;
      }
    if(m.checkAddrPattern("/highmid")) {
      highmid = (m.get(0).floatValue())*10;
      }
    if(m.checkAddrPattern("/high")) {
      high = (m.get(0).floatValue())*10;
      }  
    }
  }
