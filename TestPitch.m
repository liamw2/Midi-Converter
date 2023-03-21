%Play around with functions

[x, fs] = audioread('Chinese Sax.wav'); %sound read in
clf
f0 = pitch(x, fs); %function converts it to fundamental frequency

%sound(x,fs) %play the sound

tiledlayout(2,1)

nexttile %display time domain graph
t = (0:length(x)-1)/fs;
plot(t,x)
xlabel("Time (s)")
ylabel("Amplitude")
grid minor
axis tight

nexttile %display frequency over time
pitch(x,fs)


%________________________________
%Estimate Pitch For Singing Voice
%________________________________

winLength = round(.05*fs);
overlapLength = round(.045*fs);
[f0,idx] = pitch(x,fs, Method = "SRH", WindowLength = winLength, OverlapLength = overlapLength);
tf0 = idx/fs;

hr = harmonicRatio(x,fs, Window = hamming(winLength,"periodic"), OverlapLength=overlapLength);

figure
tiledlayout(3,1)

nexttile
plot(t,x)
ylabel("Amplitude")
title("Audio Signal")
axis tight

nexttile
pitch(x,fs, Method = "SRH", WindowLength = winLength, OverlapLength = overlapLength)
title("Pitch Estimations")
xlabel("")

nexttile
harmonicRatio(x,fs, Window=hamming(winLength,"periodic"),OverlapLength=overlapLength)
title("Harmonic Ratio")

threshold = .9;
f0(hr < threshold) = nan;

tiledlayout(2,1)

nexttile
plot(tf0,f0)
xlabel("Time (s)")
ylabel("Pitch (Hz)")
title("Pitch Estimations")
grid on

%________________________
%PitchLook
%________________________

fpitch = zeros(length(f0),1); %empty array for note names
fpitch = string(fpitch);

fpitchnum = zeros(length(f0),1); %empty array for graphing notes

for c = 1:length(fpitch) %implement pitchlook
    [tempnote,tempspot] = pitchlook(f0(c,1));
    fpitch(c) = tempnote;
    fpitchnum(c) = tempspot;
end

nexttile
c = (0:length(fpitchnum)-1)/100;
plot(c,fpitchnum)
xlabel("Time (s)")
ylabel("Note")
grid minor
axis tight
