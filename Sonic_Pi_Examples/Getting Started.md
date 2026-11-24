# Description
Sonic Pi is an open-source software developed by Sam Aaron, allowing users to program music through code. The EmotiBit is open-source hardware that democratizes biometric data by giving users access to 16+ research-grade biometric signals. EmotiBeats is an open-source project integrating Sonic Pi and the EmotiBit so that users may not only visualize their biometric data through the EmotiBit oscilloscope, but also hear it.

See also: 
- [EmotiBit] (https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Getting_Started.md)
- [Sonic Pi] (https://sonic-pi.net/tutorial.html)

# Setup
Use of the EmotiBeats software assumes all EmotiBit software is up-to-date and the user is able to visualize their data through the EmotiBit oscilloscope. If unable to see data, please follow all the Setup Steps in EmotiBit (https://github.com/EmotiBit/EmotiBit_Docs/blob/master/Getting_Started.md)

The following steps involve modifying some of the base files from the EmotiBit software package. 

## Setting up Sonic Pi
1. Please download the appropriate version of Sonic Pi (https://sonic-pi.net/index.html#windows) for your operating system.
**This software will not operate on the web version**
**This was developed on ver 5.0.0 of Sonic Pi**
2. In the Prefs tab on the rightmost side of the software, ensure “Allow incoming OSC” is ticked
3. Download the EmotiBeats.sonicpi File and open it in Sonic Pi

## Setting up the EmotiBit
EmotiBeats extracts another derivative biometric data stream known as beat intervals, not included in the initial software bundle. A small and easy amount of file editing is required to view this data stream. Please follow the steps below:

1. 3 files need to be added to: on Windows, this is accomplished by going to Notepad > Options > Run as Administrator > Yes
2. Toggle the dropdown to view “All Files”
3. Open the following and make the following edits, make sure to save after each edit
    i. “ofxOscilloscopeSettings.xml”
    ii. 
