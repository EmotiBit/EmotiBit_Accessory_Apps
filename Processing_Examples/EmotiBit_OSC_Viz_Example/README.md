# Description
Processing library to read EmotiBit data from an OSC stream and visualize the data on-screen

# Dependencies
- Processing libraries
  - `oscP5`

# Instructions
- Install dependencies
- Run `EmotiBit_Read_Data_Send_OSC_Example.pde`
- Run `EmotiBit_OSC_Viz_Example.pde`
- Optionally adjust the filter variables to change how the signal is processed
- Change the code to turn biometrics into mind-blowing visuals or generative audio!

# Working with live EmotiBit data
- Stop `EmotiBit_Read_Data_Send_OSC_Example.pde`
- Run `EmotiBit Oscilloscope` and connect to an EmotiBit (see [docs.emotibit.com](http://docs.emotibit.com) to get started with EmotiBit)
  - Select `OSC` from the `Output List` dropdown
- Run `EmotiBit_OSC_Viz_Example.pde`
- Change `oscAddress` to visualize different signals. Look in `EmotiBit Oscilloscope/data/oscOutputSettings.xml` for default EmotiBit OSC port and addresses. 
- Change `samplingFreq` to match the sampling frequency of the incoming signal. See https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Working_with_emotibit_data.md#Data-type-sampling-rates for more information.



