//variables
//PImage wfrLogo;
//PImage ralphOK;
//PImage skateGlobal;
String driveMode="WUMBO";
float power;
float totalTime;
int spd;
boolean doneLoading = false;
float periodCounter = 0;
float carLoadPos = 0;

//waynes variables
//to use this, simply initialize parameters in setup() and add them to the instruments arraylist
import processing.serial.*;
Serial myPort;
String serialData;
String val;
boolean firstContact = false;
Parameter<Integer> speed;
Parameter<Float> voltage;
Parameter<Float> maxCellVoltage;
Parameter<Float> minCellVoltage;
Parameter<Float> avgCellTemp;
Parameter<Float> maxCellTemp;
Parameter<Float> motorTemp;
Parameter<Float> inverterTemp;
Parameter<Float> brakeTemp;
Parameter<Float> gearboxTemp;
Parameter<Float> rearFrameTemp;
ArrayList<Parameter> instruments = new ArrayList<Parameter>();

void setup() {
  println("HI");
  //println(Serial.list());
  size(800, 400);
  strokeWeight(5);
  smooth();
  //car = loadImage("blackcar.png");
  //car.resize(200, 100);

  //waynes setup
  //myPort = new Serial(this, "/dev/ttyUSBO", 9800, 'O', 8, 1); //use this for raspberry pi, and use bottom usb port closest to ethernet jack
  // myPort = new Serial(this, "/dev/tty.usbserial-DN05NYGH", 9600, 'O', 8, 1); //use this for windows
  //finds the new line character before going to serial event
  //myPort.bufferUntil('\n');
  println("Serial Source Found!");


  instruments.add(speed);
  instruments.add(voltage);
  thread("loadImage");
}

void draw() {
  //if (doneLoading == false) {
    //String[] periods = {" ",".", "..", "..."};
    textSize(36);
    background (0);
    //text ("loading" + periods[int(periodCounter)], width/2-60, 70);
    //image(car, carLoadPos, height-200); 
    /*if (carLoadPos < width+200){
      carLoadPos += 3;
    } else {
      carLoadPos = -200;
    }
    if (periodCounter < 3.9) {
      periodCounter += 0.04;
    } else {
      periodCounter = 0;
    }
  } else {
    if (counter<300) {
      introAnime();
    } else if (counter>=300) {
      dashSetup();
    }
  }
}*/
dashSetup();
}


void dashSetup() {
  background(0);

  screenText();//all text on screen for page 1 and 2
  //imageMode(CENTER);
  //image(wfrLogo, 400, 210);



  //fancy arc thing, just the outline dont think we need it anymore
  /* noFill();
   strokeCap(SQUARE);
   strokeWeight(1);
   stroke(255);
   arc(400, 180, 175, 175, radians(180), radians(360));
   arc(400, 180, 350, 350, radians(180), radians(360));
   line(225, 180, 310, 180);
   line(490, 180, 575, 180);*/
}
