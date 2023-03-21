% Pitch Detection

[y, fs] = audioread('Chinese Sax.wav'); %sound read in
clf
f0 = pitch(y, fs); %function converts it to fundamental frequency

sound(y,fs) %play the sound

tiledlayout(3,1)

nexttile %display time domain graph
t = (0:length(y)-1)/fs;
plot(t,y)
xlabel("Time (s)")
ylabel("Amplitude")
grid minor
axis tight

nexttile %display frequency over time
pitch(y,fs)

f0 = pitch(y,fs);
fpitch = zeros(length(f0),1); %empty array for note names
fpitch = string(fpitch);

fpitchnum = zeros(length(f0),1); %empty array for graphing notes

for c = 1:length(fpitch) %implement pitchlook
    [tempnote,tempspot] = pitchlook(f0(c,1));
    fpitch(c) = tempnote;
    fpitchnum(c) = tempspot;
end

nexttile %display note numbers over time
c = (0:length(fpitchnum)-1)/100;
plot(c,fpitchnum)
xlabel("Time (s)")
ylabel("Note")
grid minor
axis tight
