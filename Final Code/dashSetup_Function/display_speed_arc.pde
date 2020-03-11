//function that displays speed arc
void speedArc(){
   //display speed arc depending on current speed value
    if (speed.getData()<=10 && speed.getData()>0) {//less than 10
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
