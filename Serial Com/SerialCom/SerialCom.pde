//to use this, simply initialize parameters in setup() and add them to the instruments arraylist
import processing.serial.*;
Serial myPort;
float speed = 0;
float temp;
float voltage = 0;
String serialData;
String val;
boolean firstContact = false;
//PUT ALL PARAMETER OBJECTS HERE
Parameter<Integer> spd = new Parameter (Integer.class, 's', "Speed", 0);;
Parameter<Float> vlt = new Parameter (Float.class, 'v', "Voltage", 0.0);
//
ArrayList<Parameter> instruments = new ArrayList<Parameter>();
float sum;

void setup() {
  size (300, 300);
  //myPort = new Serial(this, "/dev/ttyUSBO", 9800, 'O', 8, 1); //use this for raspberry pi, and use bottom usb port closest to ethernet jack
  myPort = new Serial(this, "COM4", 4800, 'O', 8, 1); //use this for windows
  //finds the new line character before going to serial event
  myPort.bufferUntil('\n');
  println("Serial Source Found!");
  //ADD ALL PARAMETERS TO INSTRUMENTS ARRAYLIST
  instruments.add(spd);
  instruments.add(vlt);
}

void draw() {
  background (200, 0, 0);
  textSize(20);
  sum = spd.getData() + vlt.getData();
  text (instruments.get(0).getLabel()+ spd.getData(), 100, 100);
  text (instruments.get(1).getLabel() + vlt.getData(), 100, 200);
  text (sum, 100, 150);
}

void serialEvent(Serial myPort) {
  //get data in serial port
  serialData = myPort.readStringUntil('\n');

  if (serialData != null) {
    serialData = trim(serialData);

    //perform handshake with arduino (only does this once)
    if (firstContact == false || serialData.equals("'")) { 
      if (serialData.equals("'")) {
      myPort.clear();
      firstContact = true;
      myPort.write("'");
      println("Contact Established");
       }

      //determines which variable to update based on flag (bit 1)
      //use this part to update any variables on the dashboard. Ensure they are converted to the correct datatype

      //this part will update all parameters stated and automatically detect datatype
    } else {
      println("Update Data");
      println(serialData);
      for (int i = 0; i < instruments.size(); i++) {
        if (serialData.charAt(0) == instruments.get(i).getIdent()) {
          instruments.get(i).updateData(serialData.substring(1));
        }
        /*
      if (serialData.charAt(0) == 's') {
         //speed = Integer.valueOf(serialData.substring(1));
         spd.updateData(Integer.valueOf(serialData.substring(1)));
         } else if (serialData.charAt(0) == 'v') {
         //voltage = Float.valueOf(serialData.substring(1));
         vlt.updateData(Float.valueOf(serialData.substring(1)));
         }
         */
      }
    }
  }
}
