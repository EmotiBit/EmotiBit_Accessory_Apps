# Description
Processing library to read EmotiBit data from an OSC stream and visualize the data on-screen and on a digital output of a connected Arduino.

# Dependencies
- Hardware
  - Arduino compatible board programmed with `StandardFirmata` firmware (see [instructions here](https://www.instructables.com/Arduino-Installing-Standard-Firmata/))
  - LED (or other circuit element) connected between pin 11 and GND
  - [ToDo: insert image of Arduino hookup]
- Processing libraries
  - `oscP5`  
  - `Arduino (Firmata)`

# Instructions
- Install / hookup dependencies
- Connect USB to Arduino 
- Run `EmotiBit_Read_Data_Send_OSC_Example.pde`
- Run `EmotiBit_OSC_Viz_Ard_Example.pde`
- Optionally adjust the filter variables to change how the signal is processed
- Do something new and/or weird! Hook up a solenoid to water your plants every time a heartbeat is detected. Or hook up a servo motor to feed your cat every time there's an EDA spike... biometrics without borders!

# Working with live EmotiBit data
- Stop `EmotiBit_Read_Data_Send_OSC_Example.pde`
- Run `EmotiBit Oscilloscope` and connect to an EmotiBit (see [docs.emotibit.com](http://docs.emotibit.com) to get started with EmotiBit)
  - Select `OSC` from the `Output List` dropdown
- Run `EmotiBit_OSC_Viz_Ard_Example.pde`
- Change `oscAddress` to visualize different signals. Look in `EmotiBit Oscilloscope/data/oscOutputSettings.xml` for default EmotiBit OSC port and addresses. 
- Change `samplingFreq` to match the sampling frequency of the incoming signal. See https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Working_with_emotibit_data.md#Data-type-sampling-rates for more information.



