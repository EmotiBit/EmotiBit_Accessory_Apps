# Description
Processing library to read EmotiBit data from a parsed data file and stream it via OSC

# Dependencies
- Processing libraries
  - `oscP5`  

# Instructions
- Install dependencies
- Run `EmotiBit_Read_Data_Send_OSC_Example.pde` to read EmotiBit data from file and stream over OSC
- Run `EmotiBit_OSC_Viz_Example.pde` to see the data 
- Change the `dataType` and `frequency` in `EmotiBit_Read_Data_Send_OSC_Example.pde` and re-run to read differnt biometrics (e.g. to read electrodermal activity, change to: 
  ```
  String dataType = "EA";
  float frequency = 25;
  ``` 
  - See https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Working_with_emotibit_data.md#emotibit-data-types for a full list of data TypeTags.


