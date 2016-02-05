function [sequence t1 t2] = makeSequence(lag,t1Pos)
% function to create the sequence with specified lag, randomly drawing the
% position of t1 and the identity of t1
global par;

% creat vector with alphabet, excluding specific letters.
alphabet = ('A':'Z');
alphabet(regexp(alphabet,par.excluded))=[];

% sample 2 letters from the alphabet
letters = datasample(alphabet,2,'Replace',false);
t1 = letters(1);
t2 = letters(2);

% keep shuffling a 21 number vector until it contains no 2 identical
% adjacing numbers
sequence = num2str(repelem(1:9,3));
sequence = sequence(~isspace(sequence));
while any(diff(sequence)==0)
    sequence = sequence(randperm(length(sequence)));
end
sequence = sequence(1:par.sequenceLength);

% insert t1 (and t2 if lag and t1Pos is not 0) into stream
if t1Pos ~= 0
    sequence(t1Pos) = t1;
    if lag ~= 0
        t2Pos = t1Pos + lag;
        sequence(t2Pos) = t2;
    else t2 = 'NONE';
    end
else t1 = 'NONE'; t2 = 'NONE';
end
end