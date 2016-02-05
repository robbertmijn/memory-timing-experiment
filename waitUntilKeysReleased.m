function waitUntilKeysReleased()
%
% Keeps polling the system until no keys are depressed anymore.
%
% If the keys defined in par.quitKeys are simultenously pressed,
% the function throws an error.
%
% Example:
%
%   waitUntilKeysReleased()
%
% HvR 100302 Initial version.
%
%%

global par;

% Only return from this function when no key is pressed anymore.
[ waitKeyIsDown, waitTimeSecs, waitKeyCode ] = KbCheck;
while waitKeyIsDown
  % If the global quitKeys are pressed, throw an error.
  if (sum(waitKeyCode(par.quitKeys)) == length(par.quitKeys))  
    error('User pressed quit keys');
  end
  % Don't hog the processor.
  WaitSecs(0.1);
  [ waitKeyIsDown, waitTimeSecs, waitKeyCode ] = KbCheck;
end
