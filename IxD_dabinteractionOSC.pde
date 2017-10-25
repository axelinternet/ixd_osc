import oscP5.*;
import netP5.*;
import processing.sound.*;

PImage img;
PImage imgsad;
OscP5 oscP5;
float accX;
float accY;
float accZ;
float roll;
float pitch;
PImage[] imgArr = {img, imgsad};
int selecta;

SoundFile[] soundArr;
SoundFile dunderpatrullen;
SoundFile hives;
SoundFile kodaline;
SoundFile overwerk;
SoundFile ted;

void setup() {
  oscP5 = new OscP5(this,12000);
  size(650,1146);
  img = loadImage("cool_hives_image.png");
  imgsad = loadImage("sad_hives_image.png");
  selecta = 0;
  imgArr[0] = img;
  imgArr[1] = imgsad;

  // Load files

  soundArr[0] = new SoundFile(this, "dunderpatrullen.wav");
  soundArr[1] = new SoundFile(this, "hives.wav");
  soundArr[2] = new SoundFile(this, "kodaline.wav");
  soundArr[3] = new SoundFile(this, "overwerk.wav");
  soundArr[4] = new SoundFile(this, "ted.wav");

}

void draw() {
  background(80);
  image(imgArr[selecta], 0, 0);
  textSize(42);
  if (pitch > 40) {
    fill(255,0,0);
    ellipse(56, 46, 55, 55);
    selecta = 1;
  }
  if (pitch < -40) {
    fill(0,255,0);
    ellipse(156, 46, 55, 55);
    selecta = 0;
  }
  text(str(round(roll)), 100, 300); 
  text(str(round(pitch)), 100, 500); 
}

void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */ 
  if(theOscMessage.checkAddrPattern("/accelerometer/linear/x")==true) {
    if(theOscMessage.checkTypetag("f")) {
      accX = theOscMessage.get(0).floatValue(); // get the first osc argument
    }
  } else if(theOscMessage.checkAddrPattern("/accelerometer/linear/y")==true) {
    if(theOscMessage.checkTypetag("f")) {
      accY = theOscMessage.get(0).floatValue(); // get the first osc argument
    }
  } else if(theOscMessage.checkAddrPattern("/accelerometer/linear/z")==true) {
    if(theOscMessage.checkTypetag("f")) {
      accZ = theOscMessage.get(0).floatValue(); // get the first osc argument
    }
  } else if(theOscMessage.checkAddrPattern("/orientation/roll")==true) {
    if(theOscMessage.checkTypetag("f")) {
      roll = theOscMessage.get(0).floatValue(); // get the first osc argument
    }
  } else if(theOscMessage.checkAddrPattern("/orientation/pitch")==true) {
    if(theOscMessage.checkTypetag("f")) {
      pitch = theOscMessage.get(0).floatValue(); // get the first osc argument
    }
  }
  println(roll, pitch);
}//<>//