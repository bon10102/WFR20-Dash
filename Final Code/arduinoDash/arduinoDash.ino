#include <mcp_can.h>
#include <SPI.h>

int spd = 0;
float voltage = 0;
long unsigned int rxId;
unsigned char len = 0;
unsigned char rxBuf[8];
char msgString[128];

#define CAN0_INT 2                              // Set INT to pin 2
MCP_CAN CAN0(9);

void setup() {
  Serial.begin(4800, SERIAL_8O1);
  // Initialize MCP2515 running at 16MHz with a baudrate of 500kb/s and the masks and filters disabled.
  /*if (*/CAN0.begin(MCP_ANY, CAN_500KBPS, MCP_16MHZ) /*== CAN_OK)*/;
    //Serial.println("MCP2515 Initialized Successfully!");
  //else
    //Serial.println("Error Initializing MCP2515...");
  CAN0.setMode(MCP_NORMAL);                     // Set operation mode to normal so the MCP2515 sends acks to received data.
  //pinMode(3, INPUT_PULLUP);
  //pinMode(4, INPUT_PULLUP);
  delay(100);
  establishContact();
}

void loop() {
  if (!digitalRead(CAN0_INT))                        // If CAN0_INT pin is low, read receive buffer
  {
    CAN0.readMsgBuf(&rxId, &len, rxBuf);      // Read data: len = data length, buf = data byte(s)
  }
  //spd = rxBuf[3];
  spd = 50;
  Serial.print("s");
  Serial.print(spd);
  Serial.println();
  // update any variables from CAN line
  /*
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
  */
}

void establishContact() { //performs handshake with pi
  while (Serial.available() <= 0) {
    Serial.println("'");
    delay(300);
  }
}
