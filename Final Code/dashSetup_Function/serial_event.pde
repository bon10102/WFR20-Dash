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


      for (int i = 0; i < instruments.size(); i++) {
        if (serialData.charAt(0) == instruments.get(i).getIdent()) {
          instruments.get(i).updateData(serialData.substring(1));
        }
      }
    }
  }
}
