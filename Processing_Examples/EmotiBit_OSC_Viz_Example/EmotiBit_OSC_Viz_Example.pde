// Reads EmotiBit data from an OSC stream
// Plots data in a window and controls a DIO port on Arduino!

import oscP5.*;
import netP5.*;

// ------------ CHANGE PARAMETERS HERE --------------- //
// Look in EmotiBit Oscilloscope/data/oscOutputSettings.xml for EmotiBit OSC port and addresses
String oscAddress = "/EmotiBit/0/PPG:IR"; 
int oscPort = 12345;

// Change these variables to change the filters
float samplingFreq = 25; // change to match sampling frequency of the data
boolean lowPass = true;
float lpCut = 3;
boolean highPass = true;
float hpCut = 1;

// See additional info here: 
// https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Working_with_emotibit_data.md
// https://www.emotibit.com/
// --------------------------------------------------- //

OscP5 oscP5;
FloatList dataList = new FloatList();

// filter variables
float lpFiltVal;
float hpFiltVal;
boolean firstFilt = true;

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
      
      // Filter data to extract features
      data = filter(data);
      
      dataList.append(data); // store data for plotting and autoscaling
    }
  }
}
  
// --------------------------------------------------- //
// Function to do some basic filtering of the data
// Change global filter variables at top of file
float filter(float data) {

  float DIGITAL_FILTER_PI = 3.1415926535897932384626433832795;
  float DIGITAL_FILTER_E = 2.7182818284590452353602874713526;
  float lpAlpha = pow(DIGITAL_FILTER_E, -2.f * DIGITAL_FILTER_PI * lpCut / samplingFreq);
  float hpAlpha = pow(DIGITAL_FILTER_E, -2.f * DIGITAL_FILTER_PI * hpCut / samplingFreq);
  if (lowPass) {
    if (firstFilt) {
      lpFiltVal = data;
    } else {
      lpFiltVal = data * (1. - lpAlpha) + lpFiltVal * lpAlpha;
    }
    //println("filter LP: " + data + ", " + lpFiltVal + ", " + lpAlpha);
    data = lpFiltVal;
  }
  if (highPass) {
    if (firstFilt) {
      hpFiltVal = data;
    } else {
      hpFiltVal = data * (1. - hpAlpha) + hpFiltVal * hpAlpha;
    }
    //println("filter HP: " + data + ", " + hpFiltVal + ", " + hpAlpha);
    data = data - hpFiltVal;
  }
  firstFilt = false;
  return data;
}
  
