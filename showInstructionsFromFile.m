function showInstructionsFromFile(filename, keysToContinue)

global w;
global par;

if nargin < 2
  keysToContinue = [];
end;


% Open the file with the instructions:
fid = fopen(filename);
if (fid == -1)
  error('Could not open instructions file: %s',filename);
end

% First line is always the title, will be typeset in bold:
title = fgetl(fid);

%% Other lines
instructions = '';
tline = fgetl(fid);
while ischar(tline)
  instructions = [ instructions ' ' tline ];
  tline = fgetl(fid);
end

fclose(fid);

% # in text indicates line break:
instructions = strrep(instructions,'#','\n');
% #### why replace it with itself?
instructions = strrep(instructions,'\n ','\n');

% Do the drawing:
setFont(par.instructions.header);
DrawFormattedText(w, title, 'center', 50, par.instructions.header.color);

setFont(par.instructions.body);
DrawFormattedText(w, instructions, 50, 100, par.instructions.body.color, 65, 0, 0, 1.5);

Screen('Flip', w);

waitForKeypress(keysToContinue);