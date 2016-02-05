function [sequenceList] = makeSequenceList(numTrials)
global par;

% Create a table with sequences for the entire block, including info about
% identity of t1, position of t1 and the lag between t1 and t2
sequenceList = {'sequence' 'lag' 't1Pos' 't1' 't2'};

% loop to create the sequences and add them to a table
for trial = 1:numTrials
    
    % list of the conditions [lag (0=single-target) t1Pos (00 = no-target)],
    % shuffled. Fill up a new one when it's empty
    if isempty(par.condList)
        par.condList = par.conditions;
        par.condList = par.condList(randperm(size(par.condList,1)),:);
    end
    
    % take the first lag and t1pos from the list and remove it from the list
    lag = par.condList{1,1};
    t1Pos = par.condList{1,2};
    par.condList(1,:)=[];
    
    % build the sequence
    [sequence t1 t2] = makeSequence(lag,t1Pos);
    TempSeq = {sequence lag t1Pos t1 t2};
    
    % add the sequence and it's properties to the table
    sequenceList = [sequenceList ; TempSeq];
end

end