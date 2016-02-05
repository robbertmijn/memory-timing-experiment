function [sequence t1Pos t1] = makeSequence(t1Pos t2 lag)
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

% keep shuffling a 19 number vector until it contains no 2 identical
% adjacing numbers
sequence = repelem(1:9,2);
while any(diff(sequence)==0)
    sequence = sequence(randperm(length(sequence)))
end

% insert t1 and t2 into stream
sequence(t1Pos) = t1;
if t2
    
    sequence(t1Pos) = t2;
end
end