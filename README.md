# Midi-Converter
The purpose of Midi-Converter is to take any simple audio file (isolated instruments) and convert it into a MIDI file mimicking it. The Audio Toolbox from Matlab is necessary to run the program.

Detect Pitch holds the main branch of the code and will be the file that audio is fed into. Test pitch and miditest fulfill the purpose of running and testing different methods for determining pitch and midi converstion. The other files hold functions that support processes necessary in the test files.

This project is currently in the works. The main issue I am running into is the fact that Matlab doesn't have a process built in to build an exportable midi file. I either need to find one or create a function that takes midi messages as an input and outputs a binary file that can be run as a midi file.
