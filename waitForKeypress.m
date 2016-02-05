function [ timeSecs, keyCode ] = waitForKeypress(keystocheck, returnImmediately)
%
% Keeps polling the system until a key is pressed. Returns the
% timestamp associated with the keypress, and a vector that
% indicates which key was pressed (first).
%
% If the optional argument keystocheck is defined, the function
% only checks for a keypress of the keys defined in the vector
% keystocheck. 
%
% If the optional argument returnImmediately is set to true, the
% function returns immediately after a first keypress is detected, it
% doesn't wait until all keys are depressed again. Default behavior
% is to wait.
%
% If the keys defined in par.quitKeys are simultenously pressed,
% the function throws an error.
%
% Example:
%
%   [pressTime, keyCode] = waitForKeypress([ KbName(',<') KbName('.>')],true);
%
% HvR 100302 Initial version.
% HvR 100310 Added waitForRelease.
%
%%

global par;

if nargin<1
  keystocheck = [];
end;

if nargin < 2
  returnImmediately = false;
end;

waitUntilKeysReleased(); 
keeppolling = true;

global keyCode;

% Wait until key is pressed, and released.
while keeppolling
  [ keyIsDown, timeSecs, keyCode ] = KbCheck;
  if keyIsDown
    % If the global quitKeys are pressed, throw an error.
    if (sum(keyCode(par.quitKeys)) == length(par.quitKeys))  
      error('User pressed quit keys');
    end
  
    if keystocheck 
      % If we're only looking for certain keys, check if one of
      % these keys is pressed:
      if sum(keyCode(keystocheck)) > 0
        keeppolling = false;
      end
    else
      % else any keypress is fine to jump out of the polling loop.
      keeppolling = false;
    end
  end
end

if ~returnImmediately
    waitUntilKeysReleased();
end


