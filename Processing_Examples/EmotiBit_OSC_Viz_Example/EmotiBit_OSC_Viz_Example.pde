// Reads EmotiBit data from a parsed data file
// Plots data in a window and let's you do anything you want with the data!

import oscP5.*;
import netP5.*;

// ------------ CHANGE OSC PARAMETERS HERE --------------- //
String oscAddress = "/EmotiBit/0/PPG:IR";
int oscPort = 12345;

// See additional info here: 
// https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Working_with_emotibit_data.md
// https://www.emotibit.com/
// --------------------------------------------------- //

OscP5 oscP5;
FloatList dataList = new FloatList();

// --------------------------------------------------- //
void setup() {
  size(320, 240);

  /* start oscP5, listening for incoming messages at port 12345 */
  oscP5 = new OscP5(this,oscPort);
}

// --------------------------------------------------- //
void draw() {
  if (dataList.size() > 0)
  {    
    // Create a data vizualization
    float data = dataList.get(dataList.size() - 1); // get the most recent data point
    int alpha = int(255 * autoscale(data)); // autoscale data
    println("data: " + alpha + ", " + data); // print alpha in the console
    background(alpha, 0, 0); // change the background using alpha
    
    drawData();
  }
}

// --------------------------------------------------- //
// Draw the data like an oscilloscope display
void drawData() {

  stroke(255);
    
  while (dataList.size() > width) {
    dataList.remove(0); // Remove oldest item in list if larger than window
  }
  
  // Plot the data autoscaled to the height
  for (int n = 0; n < dataList.size() - 1; n++) {
    float y1 = height * autoscale(dataList.get(n));
    float y2 = height * autoscale(dataList.get(n+1));
    line(n, height - y1, n+1, height - y2);     
  }
}

// --------------------------------------------------- //
// Outputs data value normalized to 0.0 to 1.0
float autoscale(float data) {
  if (dataList.size() > 0) {
    float minData = dataList.min(); 
    float maxData = dataList.max();
    return (data - minData) / (maxData - minData); // autoscale the data
  }
  else {
    return 0;
  }
}

// --------------------------------------------------- //
// Process incoming OSC message
// See https://sojamo.de/libraries/oscp5/reference/index.html
void oscEvent(OscMessage theOscMessage) {
  //println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
  if (theOscMessage.checkAddrPattern(oscAddress)) {
    Object[] args = theOscMessage.arguments();
    for (int n = 0; n < args.length; n++)
    {
      float data = theOscMessage.get(n).floatValue();
      dataList.append(data); // store data for plotting and autoscaling
    }
  }
}
  
