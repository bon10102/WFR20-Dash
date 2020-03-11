// CAN Receive Example
//

#include "mcp_can.h"
#include <SPI.h>

long unsigned int rxId;
byte len = 0;
byte rxBuf[8];
char msgString[128];                        // Array to store serial string

#define spiCSPin 10

//Assigned message addresses
#define addr1 500
#define addr2 501

#define CAN_INT 2                              // Set INT to pin 2
MCP_CAN CAN(spiCSPin);                               // Set CS to pin 9


void setup()
{
  Serial.begin(115200);

  // Initialize MCP2515 running at 16MHz with a baudrate of 500kb/s and the masks and filters disabled.
  if (CAN.begin(CAN_500KBPS) == CAN_OK)
    Serial.println("MCP2515 Initialized Successfully!");
  else
    Serial.println("Error Initializing MCP2515...");

  //  CAN.setMode(MCP_NORMAL);                     // Set operation mode to normal so the MCP2515 sends acks to received data.

  pinMode(CAN_INT, INPUT);                            // Configuring pin for /INT input

  Serial.println("MCP2515 Library Receive Example...");
}

void loop()
{
  //Serial.println("In Loop");
  //Serial.print(CAN.checkReceive());
  if (CAN_MSGAVAIL != CAN.checkReceive())                        // If CAN0_INT pin is low, read receive buffer
  {
    CAN.readMsgBuf(&len, rxBuf);      // Read data: len = data length, buf = data byte(s)
    Serial.print("ID OF DEVICE: "); Serial.print(rxId, DEC); Serial.println();
    Serial.print("MESSAGE: ");
   for (int j = 0; j < 8; j++) {
      Serial.print(rxBuf[j]);
      Serial.print(" ");
    }
    Serial.println(); 
  }
}

/*********************************************************************************************************
  END FILE
*********************************************************************************************************/
