import oscP5.*;
import netP5.*;

OscP5 oscP5;
float accX;
float accY;
float accZ;

void setup() {
  oscP5 = new OscP5(this,12000);
  size(800,800);
}

void draw() {
  background(80);
  textSize(42);
  text(str(accX), 100, 300); 
  text(str(accY), 100, 500); 
  text(str(accZ), 100, 700); 
}

void oscEvent(OscMessage theOscMessage) {
  println("KQSJDLKAJSDLKAJSDLKJASLDKJASLKDJAS");
  /* check if theOscMessage has the address pattern we are looking for. */  
  if(theOscMessage.checkAddrPattern("/accelerometer/x")==true) {
    println("XXX"); //<>//
    if(theOscMessage.checkTypetag("f")) {
      accX = theOscMessage.get(0).floatValue(); // get the first osc argument
      print("### PARTY typetag f.");
      println(accX);
      return;
    }
  }  
  if(theOscMessage.checkAddrPattern("/accelerometer/y")==true) {
    println("YYY"); //<>//
    if(theOscMessage.checkTypetag("f")) {
      accY = theOscMessage.get(0).floatValue(); // get the first osc argument
      print("### PARTY typetag f.");
      println(accY);
      return;
    }
  }  
  if(theOscMessage.checkAddrPattern("/accelerometer/z")==true) {
    println("ZZZ"); //<>//
    if(theOscMessage.checkTypetag("f")) {
      accZ = theOscMessage.get(0).floatValue(); // get the first osc argument
      print("### PARTY typetag f.");
      println(accZ);
      return;
    }
  }
  println("### received an osc message. with address pattern "+
          theOscMessage.addrPattern()+" typetag "+ theOscMessage.typetag()); //<>//
} //<>//