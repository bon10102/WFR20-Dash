//Pushing PB3 adds 1 to speed, pushing PB4 adds 0.1 to velocity
//String spd = "0";
//String voltage = "0";
int spd = 0;
float voltage = 0;

void setup() {
  Serial.begin(9600, SERIAL_8O1);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  establishContact();
}

void loop() {
  // update any variables from CAN line
  if (digitalRead(3) == LOW) {
    //spd = spd.toInt() + 1;
    spd++;
    Serial.print("s");
    Serial.print(spd);
    Serial.println();
  }
  else if (digitalRead (4) == LOW) {
    //voltage = voltage.toFloat() + 0.1;
    voltage += .1;
    Serial.print("v");
    Serial.print(voltage);
    Serial.println();
  } else {
    Serial.println("no Data!");
  }
  delay (200);
}

void establishContact() { //performs handshake with pi
  while (Serial.available() <= 0) {
    Serial.println("'");
    delay(300);
  }
}
