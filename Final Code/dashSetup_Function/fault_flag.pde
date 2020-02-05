boolean faultFlag =false;//this needs to be triggered when a fault code occurs

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
