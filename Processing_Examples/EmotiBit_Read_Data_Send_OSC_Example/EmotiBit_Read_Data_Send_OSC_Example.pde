// Reads EmotiBit data from a parsed data file and plays back data over OSC

import oscP5.*;
import netP5.*;

// ------------ CHANGE DATA + OSC PARAMETERS HERE --------------- //
// Set oscAddress and oscPort to match settings in receiver
String oscAddress = "/EmotiBit/0/PPG:IR";
int oscPort = 12345;

String dataType = "PI";
float frequency = 25; //in Hz (samples per second)
String dataFilename = "data/2021-04-12_16-53-27-967617_" + dataType + ".csv";

// See additional info here: 
// https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Working_with_emotibit_data.md
// https://www.emotibit.com/
// https://www.kickstarter.com/projects/emotibit/930776266?ref=5syezv&token=7176d37c 
// --------------------------------------------------- //

OscP5 oscP5;
NetAddress myRemoteLocation;
Table table;
int row = 0;

// --------------------------------------------------- //
void setup() {
  size(320, 240);
  
  oscP5 = new OscP5(this,oscPort+1);
  myRemoteLocation = new NetAddress("127.0.0.1",oscPort);

  table = loadTable(dataFilename, "header");

  println(table.getRowCount() + " total rows in table");
}

// --------------------------------------------------- //
void draw() {
  text("Sending data over OSC\noscPort: " + oscPort + "\noscAddress: " + oscAddress, 40, 100);
  
  float data = table.getRow(row).getFloat(dataType); // get the data from a row of the table
  println("data: " + data); // print alpha in the console
  
  // Send data over OSC
  OscMessage myMessage = new OscMessage(oscAddress);
  myMessage.add(data);
  oscP5.send(myMessage, myRemoteLocation); 
  
  row = row + 1; // Go to the next row in the table
  if (row >= table.getRowCount()) {
    row = 0; // start over at the beginning of the table
  }
  
  delay(int(1000/frequency)); // playback data at specific frequency
}
 
