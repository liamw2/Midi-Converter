% Note Duration Calculator

function [timeslist, noteslist] = durcalc(fpitchnum, tempo)

%Pass in array of note numbers hella
%Output consolidated array that determines how long each note is held
%Output consolidated array that is the notes for the corresponding
%durations
%Duration needs to be in beats not seconds

%If the next sample is the same note, then it is part of the previous
%Must have at least 10 samples bfore added

temp = sec2beat(secs, tempo);

curnote = 0;
index = 1;
timeslist = [];
noteslist = [];
nancount = 0;

for c = 1:length(fpitchnum)

    if curnote ~= fpitchnum(c)
        
        if dur > 4 %if current iteration is long enough
            %add curnote with dur to the list
            timeslist(index) = dur;
            noteslist(index) = curnote;
            dur = 0;
            prevnote = curnote;
            curnote = fpitchnum(c);
            index = index + 1;

        elseif prevnote == fpitchnum(c) %if current iteration is a glitch
            %take previous list value and add it 
            index = index - 1;
            dur = timeslist(index) + dur;
            curnote = prevnote;
            prevnote = 0;
        else %current iteration is glitch not in a held note
            %add nan with dur to list
            timeslist(index) = dur;
            noteslist(index) = nan;
            dur = 0;
            prevnote = nan;
            curnote = fpitchnum(c);
            index = index + 1;
        end
        dur = dur + 1;
    
    elseif curnote == fpitchnum(c)
        dur = dur + 1;
    end
    if c == length(fpitchnum)
        timeslist(index) = dur;
        noteslist(index) = curnote;
    end

end
