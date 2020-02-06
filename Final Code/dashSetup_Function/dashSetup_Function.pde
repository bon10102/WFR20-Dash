//variables
PImage wfrLogo;
PImage ralphOK;
PImage skateGlobal;
String driveMode="WUMBO";
float power;
float totalTime;
int spd;

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
  println(Serial.list());
  size(800, 400);
  strokeWeight(5);
  smooth();
  wfrLogo = loadImage("logoNoBackground.png");
  wfrLogo.resize(400, 50);
  ralphOK = loadImage("ralphOK.png");
  ralphOK.resize(100, 100);
  skateGlobal = loadImage("skateOnGlobalWarming.png");
  skateGlobal.resize(100, 100);

  //car driving across setup
  car = loadImage("blackcar.png");
  car.resize(200, 100);
  blackLogo= loadImage("WFR.png");
  blackLogo.resize(800, 150);

  //waynes setup
  myPort = new Serial(this, "/dev/ttyUSBO", 9800, 'O', 8, 1); //use this for raspberry pi, and use bottom usb port closest to ethernet jack
  // myPort = new Serial(this, "/dev/tty.usbserial-DN05NYGH", 9600, 'O', 8, 1); //use this for windows
  //finds the new line character before going to serial event
  myPort.bufferUntil('\n');
  println("Serial Source Found!");
  speed = new Parameter (Integer.class,'s', "speed.getData()", 100);
  voltage = new Parameter (Float.class,'v', "Voltage", 0.0);
  //Spencer added these make sure they are okay wayne
  maxCellVoltage = new Parameter(Float.class,'a', "Max Cell Voltage", 0);
  minCellVoltage = new Parameter(Float.class,'b', "Min Cell Voltage", 0);
  avgCellTemp = new Parameter(Float.class,'c', "Average Cell Temp", 0);
  motorTemp = new Parameter(Float.class,'d', "Motor Temp", 0);
  inverterTemp = new Parameter(Float.class,'e', "Inverter Temp", 0);
  brakeTemp = new Parameter(Float.class,'f', "Brake Temp", 0);
  gearboxTemp = new Parameter(Float.class,'g', "Gearbox Temp", 0);
  rearFrameTemp = new Parameter(Float.class,'h', "Rear Frame Temp", 0);
  maxCellTemp = new Parameter(Float.class,'i', "Max Cell Temp", 0);

  instruments.add(speed);
  instruments.add(voltage);
}

void draw() {
  if (counter<300) {
    introAnime();
  } else if (counter>=300) {
    dashSetup();
  }
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
