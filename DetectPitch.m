%Play around with functions

[x, fs] = audioread('Chinese Sax.wav'); %sound read in
f0 = pitch(x, fs); %function converts it to fundamental frequency


%________________________________
%Estimate Pitch For Singing Voice hella
%________________________________

winLength = round(.05*fs);
overlapLength = round(.045*fs);
[f0,idx] = pitch(x,fs, Method = "SRH", WindowLength = winLength, OverlapLength = overlapLength);
tf0 = idx/fs;

hr = harmonicRatio(x,fs, Window = hamming(winLength,"periodic"), OverlapLength=overlapLength);

threshold = .9;
f0(hr < threshold) = nan;

%________________________
%PitchLook
%________________________

fpitch = zeros(length(f0),1); %empty array for note names
fpitch = string(fpitch);
fpitchnum = zeros(length(f0),1); %empty array for note numbers for midi

for c = 1:length(fpitch) %implement pitchlook
    [tempnote,tempspot] = pitchlook(f0(c,1));
    fpitch(c) = tempnote;
    fpitchnum(c) = tempspot;
end

%________________________
%Determine Lengths
%________________________


