//https://github.com/coryjfowler/MCP_CAN_lib

#include <SPI.h>
#include "mcp_can.h"

#define CAN_INT 2
const int spiCSPin = 9;

MCP_CAN CAN(spiCSPin);

void setup() {
  Serial.begin(115200);

  while (CAN.begin(MCP_ANY, CAN_500KBPS, MCP_16MHZ)!= CAN_OK ) {
    Serial.println("CAN BUS init Failed");
    delay(100);
  }
  Serial.println("CAN BUS Shield Init OK!");
}
//byte stmp1[8] = {255, 0, 0, 0, 0, 0, 0, 0};
byte stmp1[8] = {0x3, 0xB, 0x5, 0xF, 0x1, 0xD, 0, 0};
byte stmp2[8] = {0, 0, 0, 0, 0, 0, 0, 0};

void loop() {
  Serial.println("In loop");

//  for (int i = 0; i <= 255; i++) {
//    stmp1[4] = i;
//    stmp1[2] = i;
//    CAN.sendMsgBuf(500, 0, 8, stmp1);
//    delay(20);
//  }
  CAN.sendMsgBuf(0x00000001, 0, 8, stmp1);
  Serial.println("MSG1");
  delay(2000);
  CAN.sendMsgBuf(0x00000010, 0, 8, stmp2);
  Serial.println("MSG2");
  delay(2000);

}
