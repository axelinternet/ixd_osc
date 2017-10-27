import oscP5.*;
import netP5.*;
import processing.sound.*;

PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage end;
PImage start;
OscP5 oscP5;
float accX;
float accY;
float accZ;
float roll;
float pitch;
float x;
PImage[] imgArr = new PImage[7];
int selecta;
Boolean readyToRock;

SoundFile[] soundArr = new SoundFile[5];
SoundFile dunderpatrullen;
SoundFile hives;
SoundFile kodaline;
SoundFile overwerk;
SoundFile ted;
SoundFile yes;
SoundFile no;


void setup() {
  yes = new SoundFile(this, "yes.wav");
  no = new SoundFile(this, "no.wav");
  oscP5 = new OscP5(this,12000);
  size(650,1146);
  one = loadImage("1a.png");
  two = loadImage("2a.png");
  three = loadImage("3a.png");
  four = loadImage("4a.png");
  five = loadImage("5a.png");
  end = loadImage("Sista.png");
  start = loadImage("0a.png");
  selecta = 6;
  imgArr[0] = one;
  imgArr[1] = two;
  imgArr[2] = three;
  imgArr[3] = four;
  imgArr[4] = five;
  imgArr[5] = end;
  imgArr[6] = start;
  // Load files

  soundArr[0] = new SoundFile(this, "dunderpatrullen.wav");
  soundArr[1] = new SoundFile(this, "hives.wav");
  soundArr[2] = new SoundFile(this, "kodaline.wav");
  soundArr[3] = new SoundFile(this, "overwerk.wav");
  soundArr[4] = new SoundFile(this, "ted.wav");
  
  readyToRock = true;
}
void goToNext(){
  if(selecta < 4){
  soundArr[selecta].stop();
  selecta +=1;
  soundArr[selecta].play();
  }
  else if(selecta == 4){ 
   soundArr[selecta].stop();
   selecta +=1;
  }
}

void draw() {
  background(80);
  image(imgArr[selecta], 0, 0, width, height);
  textSize(42);
  if (pitch > 0) { 
    readyToRock = true; 
  }
 else if (pitch < -40 && readyToRock == true) {
    yes.play();
    goToNext();
    readyToRock = false;
  } else if (roll > 90 && readyToRock == true) {
      no.play();
      goToNext();
      readyToRock = false;
  } 
  //fill(255,0,0);
  //text(str(round(roll)), 100, 300); 
  //text(str(round(pitch)), 100, 500); 
}

void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */ 
 if(theOscMessage.checkAddrPattern("/orientation/roll")==true) {
    if(theOscMessage.checkTypetag("f")) {
      roll = theOscMessage.get(0).floatValue(); // get the first osc argument
    }
  } else if(theOscMessage.checkAddrPattern("/orientation/pitch")==true) {
    if(theOscMessage.checkTypetag("f")) {
      pitch = theOscMessage.get(0).floatValue(); // get the first osc argument
    }
  }
  else if(theOscMessage.checkAddrPattern("/accelerometer/linear/x")==true) {
    if(theOscMessage.checkTypetag("f")) {
      x = theOscMessage.get(0).floatValue(); // get the first osc argument
    }
  }
  //println(roll, pitch);
}//<>//

void keyPressed() {
  if (keyCode == ENTER){
    selecta = 0;
soundArr[selecta].play();
  }
}