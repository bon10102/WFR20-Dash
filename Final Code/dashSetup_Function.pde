//variables
PImage wfrLogo;
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
ArrayList<Parameter> instruments = new ArrayList<Parameter>();








void setup() {
  size(800, 400);
  strokeWeight(5);
  smooth();
  wfrLogo = loadImage("logoNoBackground.png");
  wfrLogo.resize(400, 50);



  //waynes setup
  //myPort = new Serial(this, "/dev/ttyUSBO", 9800, 'O', 8, 1); //use this for raspberry pi, and use bottom usb port closest to ethernet jack
  myPort = new Serial(this, "COM8", 9600, 'O', 8, 1); //use this for windows
  //finds the new line character before going to serial event
  myPort.bufferUntil('\n');
  println("Serial Source Found!");
  speed = new Parameter ('s', "speed.getData()", 0);
  voltage = new Parameter ('v', "Voltage", 0.0);
  instruments.add(speed);
  instruments.add(voltage);
}

void draw() {
  dashSetup();





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
}


void dashSetup() {
  background(0);
  text();//all text on screen
  imageMode(CENTER);
  image(wfrLogo, 400, 210);



  //fancy arc thing
  noFill();
  strokeCap(SQUARE);
  strokeWeight(1);
  stroke(255);
  arc(400, 180, 175, 175, radians(180), radians(360));
  arc(400, 180, 350, 350, radians(180), radians(360));
  line(225, 180, 310, 180);
  line(490, 180, 575, 180);
}

void text() {

  //updating speed.getData()
  fill(255);
  textSize(65);
  textAlign(CENTER, CENTER);
  text(speed.getData(), 400, 160);


  //battery SOC TOP LEFT
  fill(232, 185, 35);
  textSize(20);
  textAlign(LEFT, TOP);
  text("SOC ", 0, 20);//battery percentage text 
  fill(255);
  textSize(35);
  text(voltage.getData()+ "%", 0, 50);


  //drive mode changes with potentiometer
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

  //total drive time
  textAlign(RIGHT, TOP);
  fill(232, 185, 35);
  textSize(20);
  text("DRIVE TIME", 800, 20);
  fill(255);
  textSize(35);

  //laptime
  fill(232, 185, 35);
  textSize(20);
  text("CURRENT LAP", 800, 100);


  //best lap
  fill(232, 185, 35);
  textSize(20);
  text("BEST LAP", 800, 180);
}

void lessThanTen() {
  stroke(51, 255, 153);
  strokeCap(SQUARE);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(180), radians(195));
}

void tenToTwenty() {
  stroke(51, 255, 51);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(195), radians(210));
}

void twentyToThirty() {
  stroke(51, 255, 51);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(210), radians(225));
}

void thirtyToForty() {
  stroke(153, 255, 51);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(225), radians(240));
}

void fortyToFifty() {
  stroke(255, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(240), radians(255));
}

void fiftyToSixty() {
  stroke(255, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(255), radians(270));
}

void sixtyToSeventy() {
  stroke(255, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(270), radians(285));
}

void seventyToEighty() {
  stroke(255, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(285), radians(300));
}

void eightyToNinety() {
  stroke(255, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(300), radians(315));
}

void ninetyToHundred() {
  stroke(255, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(315), radians(330));
}

void hundredToHundredTen() {
  stroke(255, 255, 0);
  strokeWeight(88);
  arc(400, 180, 264, 264, radians(330), radians(345));
}

void hundredTenToHundredTwenty() {
  stroke(255, 255, 0);
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
