# Description
Processing library to log live EmotiBit data streams sent from the EmotiBit Oscilloscope over an OSC stream.

# Dependencies
- Processing libraries
  - `oscP5`

# Instructions
- Install dependencies
- Run `EmotiBit Oscilloscope` and connect to an EmotiBit (see [docs.emotibit.com](http://docs.emotibit.com) to get started with EmotiBit)
  - Select `OSC` from the `Output List` dropdown
- Change `oscAddress` to visualize different signals. Look in `EmotiBit Oscilloscope/data/oscOutputSettings.xml` for default EmotiBit OSC port and addresses. 
- Run `EmotiBit_OSC_DataLog_Example.pde`
- Find one saved file per data type in the project directory
- See `EmotiBit_Read_Data_Send_OSC_Example/README.md` for more tips including live visualization and processing options



