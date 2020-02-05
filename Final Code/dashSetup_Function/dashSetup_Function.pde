//variables
PImage wfrLogo;
PImage ralphOK;
PImage skateGlobal;
String driveMode="WUMBO";
float power;
float totalTime;
int spd;
int buttonCount=0;//this is to switch pages
boolean faultFlag =false;//this needs to be triggered when a fault code occurs

//car driving across variables
PImage car;
PImage blackLogo;
int totalFrames =120;
int counter =0;



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
  //myPort = new Serial(this, "/dev/ttyUSBO", 9800, 'O', 8, 1); //use this for raspberry pi, and use bottom usb port closest to ethernet jack
  // myPort = new Serial(this, "/dev/tty.usbserial-DN05NYGH", 9600, 'O', 8, 1); //use this for windows
  //finds the new line character before going to serial event
  // myPort.bufferUntil('\n');
  println("Serial Source Found!");
  speed = new Parameter ('s', "speed.getData()", 100);
  voltage = new Parameter ('v', "Voltage", 0.0);
  //Spencer added these make sure they are okay wayne
  maxCellVoltage = new Parameter('a', "Max Cell Voltage", 0);
  minCellVoltage = new Parameter('b', "Min Cell Voltage", 0);
  avgCellTemp = new Parameter('c', "Average Cell Temp", 0);
  motorTemp = new Parameter('d', "Motor Temp", 0);
  inverterTemp = new Parameter('e', "Inverter Temp", 0);
  brakeTemp = new Parameter('f', "Brake Temp", 0);
  gearboxTemp = new Parameter('g', "Gearbox Temp", 0);
  rearFrameTemp = new Parameter('h', "Rear Frame Temp", 0);
  maxCellTemp = new Parameter('i', "Max Cell Temp", 0);



  instruments.add(speed);
  instruments.add(voltage);
}


//car driving across animation
void introAnime() {

  float percent = (float)counter/totalFrames;
  render(percent);
  counter++;
}
//function for car driving across
void render(float percent) {//for car driving across
  if (counter<120) {
    background(0);
    image(car, percent*width, height/2);
  } else {
    background(255);
    imageMode(CENTER);
    image(blackLogo, 400, 200);
  }
}

int buttonPush(int buttonCount) { //this function will return 0 for page one or 1 for page 2 depending on a button push from the dashboard
  //!!!!!!!add if button is pushed increase count by 1!!!!!!!!
  int temp = buttonCount%2;
  println(temp);
  return temp;//will return 1 or 0
}

void draw() {
  if (counter<300) {
    introAnime();
  } else if (counter>=300) {
    dashSetup();
  }
}


void dashSetup() {
  //!!need to add start up animation here !!
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

void faultBar() {
  //always show fault bar across bottom of screen
  strokeWeight(1);
  stroke(255);
  line(0, 300, 800, 300);// line across top of fault bar
  if (faultFlag==false) {//display no errors
    imageMode(CORNER);
    image(ralphOK, 0, 300);
    fill(255);
    textAlign(LEFT);
    textSize(65);
    text("OKAY", 100, 385);//not showing up for buttonCounter even numbers, dont know why
    println("fault flag false");
  } else if (faultFlag==true) {//fault triggered
    imageMode(CORNER);
    image(skateGlobal, 0, 300);
    fill(255);
    textAlign(LEFT);
    textSize(65);
    text("UHOH", 100, 385);//also doesnt show up for buttonCounter even numbers 
    println("fault flag true");
  }
}


void screenText() {
  //show fault bar on screen
  faultBar();

  if (buttonPush(buttonCount)==0) {//displays page one
    //PAGE1

    //update speed
    speedArc();
    


    //battery SOC TOP LEFT
    fill(232, 185, 35);
    textSize(20);
    textAlign(LEFT, TOP);
    text("SOC ", 0, 20);//battery percentage text 
    fill(255);
    textSize(35);
    text(voltage.getData()+ "%", 0, 50);


    //drive mode changes with potentiometer, under speed in the middle
    textAlign(CENTER);
    textSize(20);
    text(driveMode, 400, 130);

    //power dc current limit as adjusted by power knob on wheel, shown as percentage of our max dc output MIDDLE LEFT
    textAlign(LEFT, TOP);
    fill(232, 185, 35);
    textSize(20);
    text("POWER", 0, 100);
    fill(255);
    textSize(35);
    text(power+"%", 0, 130);

    //total drive time top rright
    textAlign(RIGHT, TOP);
    fill(232, 185, 35);
    textSize(20);
    text("DRIVE TIME", 800, 20);
    fill(255);
    textSize(35);

    // currentlaptime middle right
    fill(232, 185, 35);
    textSize(20);
    text("CURRENT LAP", 800, 100);


    //best lap bottom right
    fill(232, 185, 35);
    textSize(20);
    text("BEST LAP", 800, 180);
  }//end of page 1

  else if (buttonPush(buttonCount)==1) {
    //PAGE2
    //battery voltage TOPLEFT
    fill(232, 185, 35);
    textAlign(TOP, LEFT);
    textSize(20);
    text(voltage.getLabel()+voltage.getData()+ "%", 0, 20);

    //Max cell voltage MIDDLELEFT
    textAlign(LEFT, TOP);
    fill(232, 185, 35);
    textSize(20);
    text(maxCellVoltage.getLabel() +maxCellVoltage.getData()+" V", 0, 40);


    //min cell voltage BOTTOM LEFT
    textAlign(LEFT, TOP);
    fill(323, 185, 35);
    textSize(20);
    text(minCellVoltage.getLabel() +minCellVoltage.getData()+" V", 0, 80);

    //max cell temp
    textAlign(CENTER, TOP);
    fill(323, 185, 35);
    textSize(20);
    text(maxCellTemp.getLabel()+maxCellTemp.getData()+ " degrees", 400, 0);

    //avg cell temp
    textAlign(CENTER, TOP);
    fill(323, 185, 35);
    textSize(20);
    text(avgCellTemp.getLabel()+avgCellTemp.getData()+" degrees", 400, 40);

    //motor temp
    textAlign(CENTER, TOP);
    fill(323, 185, 35);
    textSize(20);
    text(motorTemp.getLabel()+motorTemp.getData()+" degrees", 400, 80);

    //inverter temp
    textAlign(RIGHT, TOP);
    fill(323, 185, 35);
    textSize(20);
    text(motorTemp.getLabel()+motorTemp.getData()+ " degrees", 800, 0);

    //brake temp
    textAlign(RIGHT, TOP);
    fill(323, 185, 35);
    textSize(20);
    text(brakeTemp.getLabel()+brakeTemp.getData()+" degrees", 800, 40);

    //gearbox temp
    textAlign(RIGHT, TOP);
    fill(323, 185, 35);
    textSize(20);
    text(gearboxTemp.getLabel()+gearboxTemp.getData()+" degrees", 800, 80);

    //rear frame temp
    textAlign(RIGHT, TOP);
    fill(323, 185, 35);
    textSize(20);
    text(rearFrameTemp.getLabel()+rearFrameTemp.getData()+" degrees", 800, 120);
  }//end of page 2
}

void lessThanTen() {
  noFill();
  stroke(0, 255, 44);
  strokeCap(SQUARE);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(180), radians(195));
}

void tenToTwenty() {
  noFill();
  stroke(75, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(195), radians(210));
}

void twentyToThirty() {
  noFill();
  stroke(114, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(210), radians(225));
}

void thirtyToForty() {
  noFill();
  stroke(152, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(225), radians(240));
}

void fortyToFifty() {
  noFill();
  stroke(182, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(240), radians(255));
}

void fiftyToSixty() {
  noFill();
  stroke(255, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(255), radians(270));
}

void sixtyToSeventy() {
  noFill();
  stroke(255, 230, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(270), radians(285));
}

void seventyToEighty() {
  noFill();
  stroke(255, 213, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(285), radians(300));
}

void eightyToNinety() {
  noFill();
  stroke(255, 175, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(300), radians(315));
}

void ninetyToHundred() {
  noFill();
  stroke(255, 102, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(315), radians(330));
}

void hundredToHundredTen() {
  noFill();
  stroke(255, 72, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(330), radians(345));
}

void hundredTenToHundredTwenty() {
  noFill();
  stroke(255, 21, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(345), radians(360));
}


void serialEvent(Serial myPort) {
  //get data in serial port
  serialData = myPort.readStringUntil('\n');

  if (serialData != null) {
    serialData = trim(serialData);

    //perform handshake with arduino (only does this once)
    if (firstContact == false || serialData.equals("'")) { 
      //if (serialData.equals("'")) {
      myPort.clear();
      firstContact = true;
      myPort.write("'");
      println("Contact Established");
      // }

      //determines which variable to update based on flag (bit 1)
      //use this part to update any variables on the dashboard. Ensure they are converted to the correct datatype

      //this part will update all parameters stated and automatically detect datatype
    } else {


      if (serialData.charAt(0) == 's') {
        //speed = Integer.valueOf(serialData.substring(1));
        speed.updateData(Integer.valueOf(serialData.substring(1)));
      } else if (serialData.charAt(0) == 'v') {
        //voltage = Float.valueOf(serialData.substring(1));
        voltage.updateData(Float.valueOf(serialData.substring(1)));
      }
    }
  }
}
//function that displays speed arc
void speedArc(){
   //display speed arc depending on current speed value
    if (speed.getData()<=10&& speed.getData()>0) {//less than 10
      lessThanTen();
    }
    if (speed.getData()>=10 && speed.getData()<20) {//10 to 20
      lessThanTen();
      tenToTwenty();
    }
    if (speed.getData()>=20&& speed.getData() <30) {//20 to 30
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
    }
    if (speed.getData()>=30 && speed.getData()<40) {//30 to 40
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
    }
    if (speed.getData() >=40 && speed.getData() <50) {//40 to 50
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
      fortyToFifty();
    }
    if (speed.getData() >=50 && speed.getData()<60) {//50 to 60
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
      fortyToFifty();
      fiftyToSixty();
    }
    if (speed.getData()>=60 && speed.getData()<70) {//60 to 70
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
      fortyToFifty();
      fiftyToSixty();
      sixtyToSeventy();
    }
    if (speed.getData() >=70&& speed.getData() <80) {//70 to 80
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
      fortyToFifty();
      fiftyToSixty();
      sixtyToSeventy();
      seventyToEighty();
    }
    if (speed.getData() >=80&& speed.getData() <90) {//80 to 90
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
      fortyToFifty();
      fiftyToSixty();
      sixtyToSeventy();
      seventyToEighty();
      eightyToNinety();
    }
    if (speed.getData() >=90&& speed.getData() <100) {//90 to 100
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
      fortyToFifty();
      fiftyToSixty();
      sixtyToSeventy();
      seventyToEighty();
      eightyToNinety();
      ninetyToHundred();
    }
    if (speed.getData() >=100&& speed.getData() <110) {//100 to 110
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
      fortyToFifty();
      fiftyToSixty();
      sixtyToSeventy();
      seventyToEighty();
      eightyToNinety();
      ninetyToHundred();
      hundredToHundredTen();
    }
    if (speed.getData() >=110) {//110+
      lessThanTen();
      tenToTwenty();
      twentyToThirty();
      thirtyToForty();
      fortyToFifty();
      fiftyToSixty();
      sixtyToSeventy();
      seventyToEighty();
      eightyToNinety();
      ninetyToHundred();
      hundredToHundredTen();
      hundredTenToHundredTwenty();
    }
  //updating speed.getData()
    fill(255);
    textSize(65);
    textAlign(CENTER, CENTER);
    text(speed.getData(), 400, 160);
}
