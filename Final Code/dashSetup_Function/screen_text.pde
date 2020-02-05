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
