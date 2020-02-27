void loadImage() {
  wfrLogo = loadImage("logoNoBackground.png");
  wfrLogo.resize(400, 50);
  ralphOK = loadImage("ralphOK.png");
  ralphOK.resize(100, 100);
  println("done Logo");
  skateGlobal = loadImage("skateOnGlobalWarming.png");
  skateGlobal.resize(100, 100);

  //car driving across setup
  
  blackLogo= loadImage("WFR.png");
  blackLogo.resize(800, 150);
  println("done load screen");
  speed = new Parameter (Integer.class, 's', "speed.getData()", 100);
  voltage = new Parameter (Float.class, 'v', "Voltage", 0.0);
  //Spencer added these make sure they are okay wayne
  maxCellVoltage = new Parameter(Float.class, 'a', "Max Cell Voltage", 0);
  minCellVoltage = new Parameter(Float.class, 'b', "Min Cell Voltage", 0);
  avgCellTemp = new Parameter(Float.class, 'c', "Average Cell Temp", 0);
  motorTemp = new Parameter(Float.class, 'd', "Motor Temp", 0);
  inverterTemp = new Parameter(Float.class, 'e', "Inverter Temp", 0);
  brakeTemp = new Parameter(Float.class, 'f', "Brake Temp", 0);
  gearboxTemp = new Parameter(Float.class, 'g', "Gearbox Temp", 0);
  rearFrameTemp = new Parameter(Float.class, 'h', "Rear Frame Temp", 0);
  maxCellTemp = new Parameter(Float.class, 'i', "Max Cell Temp", 0);
  doneLoading = true;
}
