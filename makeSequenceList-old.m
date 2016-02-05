function [sequenceList] = makeSeceunceList(numTrials)

% Create a table with sequences for the entire block, including info about
% identity of t1, position of t1 and the lag between t1 and t2
sequenceList = {'sequence' 't1Pos' 'lag'};

% which lags to include
lags = [1:7];

% calculate how many of each lag is needed to get the right amount to fill
% the trials
repeat = ceil (numTrials / length(lags));

% repeat the lags to get as many lags as trials and shuffle them
lags = repelem(lags,repeat);
lags = lags(randperm(length(lags)));

% loop to create the sequences and add them to a table
for trial = 1:numTrials
  % take the first lag from list of lags and remove it from the vector
  lag = lags(1);
  lags = lags(2:end);
  
  % build the sequence, return the stream, t1 position and t1 identity
  [sequence t1Pos t1] = makeSequence(lag);
  TempSeq = {sequence t1Pos t1 lag};
  
  % add the sequence and it's properties to the table
  sequenceList = [sequenceList ; TempSeq];
end

end