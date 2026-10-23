# Stylized Oscilloscope
Processing Script to read EmotiBit data from an OSC stream and visualize the data on-screen in a stylized and digital shifting window oscilloscope.

<img src="./assets/heartbeat_processing.gif">

# Dependencies
- Processing libraries
  - `oscP5`

# Instructions
- Install dependencies (see: "Adding Libraries, Tools, and Modes" section in: https://processing.org/environment/#adding-libraries-tools-and-modes)
- Download `EmotiBit_OSC_StylizedOscilloscope_Example.pde`, `EmotiBit_OSC_StylizedOscilloscope_EDA`, and/or `EmotiBit_OSC_StylizedOscilloscope_PPG_and_Heartbeat` above!
- Optionally adjust the Display variables to change how the signal is viewed

# Working with live EmotiBit data
- Run `EmotiBit Oscilloscope` and connect to an EmotiBit (see [docs.emotibit.com](http://docs.emotibit.com) to get started with EmotiBit)
  - Select `OSC` from the `Output List` dropdown
- Run one of the three Processing scripts
- Change `dataStream` to visualize different signals. Look in `EmotiBit Oscilloscope/data/oscOutputSettings.xml` for default EmotiBit OSC port and addresses. 
- Change the code to turn biometrics into new forms of self-expression or digital drugs in the metaverse! Biometrics without borders!