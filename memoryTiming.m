% This experiment runs a memory timing task, subsequently asking the participant to
% indicate on two timelines if/when he saw t1 and/or t2

%%%

% Par contains all sorts of parameter settings for the experiments,
% ranging from font-sizes to SOAs.
global par;
% The Psychtoolbox screen variable:
global w;

% function to setup all of the global parameters
setParameters();

% Clear Matlab screen
clc;

% Embed core of code in try ... catch statement. If anything goes wrong
% inside the 'try' block (Matlab error), the 'catch' block is executed to
% clean up, save results, close the onscreen window etc.
try
    
    % ### verbosity 1=none, 2=only errors
    % ### visualdebug 0-5, 5 most verbose
    oldScreenVerbosityLevel = Screen('Preference', 'Verbosity', 2);
    Screen('Preference', 'VisualDebuglevel', 3);
    % skip sync, 1 = yes
    Screen('Preference', 'SkipSyncTests', 1);
    
    % Get screenNumber of stimulation display. We choose the display with
    % the maximum index, which is usually the right one, e.g., the external
    % display on a Laptop:
    screens=Screen('Screens');
    screenNumber=max(screens);
    
    % Hide the mouse cursor:
    HideCursor;
    
    % Open a double buffered fullscreen window on the stimulation screen
    % 'screenNumber' and choose/draw a darkgrey background. 'w' is the handle
    % used to direct all drawing commands to that window - the "Name" of
    % the window. 'wRect' is a rectangle defining the size of the
    % window.
    %
    % w is a global parameter, and is used in many subfunctions to
    % gain access to the screen.
    %
    % Last parameter indicates the amount of anti-aliasing:
    %
    %### Screen(fn, screenNr, rgb, rect, pxlsize, buffers, stereomode, multisample)
    [w, wRect] = Screen('OpenWindow',screenNumber, [0 0 0], [], [], 2, [], 2);

    % Get the height and width from the screen (w), used to calculate
    % demensions of the graphics
    par.width = wRect(3);
    par.height = wRect(4);
    
    % Function to calculate the graphics used in the experiment (lines,
    % buttons, etc.)
    setDimensions(par.width,par.height);
    
    if par.onamac
        % ### turn off listening for input (0)
        ListenChar(2);
    end
    
    % Do dummy calls to GetSecs, WaitSecs, KbCheck to make sure
    % they are loaded and ready when we need them - without delays
    % at the wrong moment:
    KbCheck;
    WaitSecs(0.1);
    GetSecs;
    
    % Set priority for script execution to realtime priority:
    priorityLevel = MaxPriority(w);
    Priority(priorityLevel);
    par.ifi =Screen('GetFlipInterval', w,100);
    % Display instuctions
    showInstructionsFromFile('instructions/welcome.txt',par.nextKey);
    
    askParticipantInfo();
    
    showInstructionsFromFile('instructions/instruction1.txt',par.nextKey);
    % explain input screen
    showInstructionsFromFile('instructions/instruction2.txt',par.nextKey);
    
    
    showInstructionsFromFile('instructions/practice.txt',par.nextKey);
    
    % Execute block of trials (blocknumber, number of trials)
    % practice trials
    doMemoryTimingBlock(0,0);    
    showInstructionsFromFile('instructions/begin.txt',par.nextKey);    
    doMemoryTimingBlock(1,4);
    doBreak(1);
%     showInstructionsFromFile('instructions/break.txt',par.nextKey);
%     doMemoryTimingBlock(2,50);
%     showInstructionsFromFile('instructions/break.txt',par.nextKey);
%     doMemoryTimingBlock(3,50);
%     showInstructionsFromFile('instructions/break.txt',par.nextKey);
%     doMemoryTimingBlock(4,50);
%     showInstructionsFromFile('instructions/break.txt',par.nextKey);
%     doMemoryTimingBlock(5,50);
%     showInstructionsFromFile('instructions/break.txt',par.nextKey);
%     doMemoryTimingBlock(6,50);
    showInstructionsFromFile('instructions/thanks.txt',par.nextKey);
    
    
    
    
    % Cleanup at end of experiment - Close window, show mouse cursor, close
    % result file, switch Matlab/Octave back to priority 0 -- normal
    % priority:
    if par.onamac
        % ### turn on listening for input (0)
        ListenChar(0);
    end
    
    Screen('CloseAll');
    ShowCursor;
    fclose('all');
    Priority(0);
    Screen('Preference', 'Verbosity', oldScreenVerbosityLevel);
    
    % End of experiment:
    return;
    
catch
    
    % catch error: This is executed in case something goes wrong in the
    % 'try' part due to programming error etc.:
    
    % Do same cleanup as at the end of a regular session...
    
    if par.onamac
        ListenChar(0);
    end
    
    Screen('CloseAll');
    ShowCursor;
    fclose('all');
    Priority(0);
    Screen('Preference', 'Verbosity', oldScreenVerbosityLevel);
    
    % Output the error message that describes the error:
    psychrethrow(psychlasterror);
    
end
