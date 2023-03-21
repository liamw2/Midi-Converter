%Pitch Lookup

function [note,spot] = pitchlook(freq)

%Frequencies for Equal Temperment
pitchbook = [16.35 17.32 18.35 19.45 20.60 21.83 23.12 24.50 25.96 27.50 29.14 30.87 32.70 34.65 36.71 38.89 41.20 43.65 46.25 49.00 51.91 55.00 58.27 61.74 65.41 69.30 73.42 77.78 82.41 87.31 92.50 98.00 103.83 110.00 116.54 123.47 130.81 138.59 146.83 155.56 164.81 174.61 185.00 196.00 207.65 220.00 233.08 246.94 261.63 277.18 293.66 311.13 329.63 349.23 369.99 392.00 415.30 440.00 466.16 493.88 523.25 554.37 587.33 622.25 659.25 698.46 739.99 783.99 830.61 880.00 932.33 987.77 1046.50 1108.73 1174.66 1244.51 1318.51 1396.91 1479.98 1567.98 1661.22 1760.00 1864.66 1975.53 2093.00];
%Note Names
notebook = ["C0" "Db0" "D0" "Eb0" "E0" "F0" "Gb0" "G0" "Ab0" "A0" "Bb0" "B0" "C1" "Db1" "D1" "Eb1" "E1" "F1" "Gb1" "G1" "Ab1" "A1" "Bb1" "B1" "C2" "Db2" "D2" "Eb2" "E2" "F2" "Gb2" "G2" "Ab2" "A2" "Bb2" "B2" "C3" "Db3" "D3" "Eb3" "E3" "F3" "Gb3" "G3" "Ab3" "A3" "Bb3" "B3" "C4" "Db4" "D4" "Eb4" "E4" "F4" "Gb4" "G4" "Ab4" "A4" "Bb4" "B4" "C5" "Db5" "D5" "Eb5" "E5" "F5" "Gb5" "G5" "Ab5" "A5" "Bb5" "B5" "C6" "Db6" "D6" "Eb6" "E6" "F6" "Gb6" "G6" "Ab6" "A6" "Bb6" "B6" "C7"];

%Loop Checks
check = 0;
pitchlen = length(pitchbook);
checklen = pitchlen;
offset = 0;

if isnan(freq)
    check = 1;
    note = "NaN"; %#ok<NASGU> 
    spot = nan;
end


while check == 0
    checklen = floor((checklen)/2); %decrease
    
    spot = checklen+offset; 
    %disp(['spot check ', num2str(spot)]);
    if spot == 1 || spot == pitchlen %if loop reaches ends or no, outputs highest or lowest note
        check = 1;
        continue
    end
    if (pitchbook(spot) > freq)
        %disp(['too big ',num2str(pitchbook(spot))]);
        down = (pitchbook(spot)-pitchbook(spot-1))/2; %middle of spot and spot below
        %disp(['new offset of ', num2str(offset)])
        if pitchbook(spot)-down < freq %check if spot is closer than spot below
            check = 1;
            continue
        end

        
    elseif (pitchbook(spot) < freq)
        %disp(['too small ',num2str(pitchbook(spot))]);
        up = (pitchbook(spot+1)-pitchbook(spot))/2; %middle of spot and spot above
        offset = offset + checklen;
        %disp(['new offset of ', num2str(offset),' (new ',num2str(checklen),')'])
        if pitchbook(spot)+up > freq %check if spot is closer than spot above
            check = 1;
            continue
        end
        if checklen == 1 %floor rounding makes a value possible to be skipped, check that
            checklen = 2;
        end
    elseif pitchbook(spot) == freq
        check = 1;

    end

end
if ~isnan(freq)
    note = notebook(spot);
end
