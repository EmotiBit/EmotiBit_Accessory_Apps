# Description
Processing library to read EmotiBit data from a parsed data file and send it over OSC.

# Dependencies
- Processing libraries
  - `oscP5`  

# Instructions
- Install dependencies
- Run `EmotiBit_Read_Data_Send_OSC_Example.pde` to read EmotiBit data from file and stream over OSC
- Run `EmotiBit_OSC_Viz_Ard_Example.pde` to see the data 
- Change the `dataType` and `frequency` in `EmotiBit_Read_Data_Send_OSC_Example.pde` and re-run to read differnt biometrics (e.g. change to `"EA"` to read electrodermal activity. See https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Working_with_emotibit_data.md#emotibit-data-types for a full list.


