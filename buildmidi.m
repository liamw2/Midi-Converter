%Build Midi hella

function [msg] = buildmidi(note)

channel = 1;
velocity = 64;
duration = 2;
timestamp = 1;

msg = midimsg('Note',channel,note,velocity,duration,timestamp);
