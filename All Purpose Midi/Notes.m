%To Do/Notes

%{
midimsg
    Channel
Type: NoteOn, Note, or NoteOff
Note: number, C0 = 0, C1 = 12, C2 = 24 [0,127]
Velocity: strength of the note [0,127]
KeyPressure: velocity after initial strike (not attack) [0,127]
LocalControl: if false, devices on channel respond only to data from midi
ChannelPressure: key pressure but for all notes over channel
PitchChange: amount to change [0,16383] (no change is 8192)
Duration: self explanatory
Timestamp: location in midimsg, size of msg

Midi Header Chunk
ticks are the unit of time, specifies timing division by ticks per quarter
note or frames per second
Time division is in 2-bytes (13-14)

Track Chunk
Header and midi events
track chunk header contains length of track chunk
the rest is one or more midi events

Midi Event
delta-time value: time difference in ticks between previous midi track
event and current one
midi message: raw data of midi track event



%}