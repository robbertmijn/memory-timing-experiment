function [estimPosT1 respT1 estimPosT2 respT2] = askResponse2(lag,t1Pos)

% function for asking a response

global par;
global w;
ShowCursor;

% set input variables
targetCompl = false;
estimCompl = false;
xcoordT1 = false;
xcoordT2 = false;
confirm = false;
respT1 = '';
respT2 = '';

% estimCompl will be true when respDigit and respE become numbers and
% confirm is pressed
while ~estimCompl
    
    % while loop will constantly update x and y positions of mouse and
    % whether buttons are pressed
    [xclick,yclick,buttons] = GetMouse(w);
    
    % a new input screen is drawn and flipped every frame, looking if responses are
    % already given
    drawInputScreen(xcoordT1,xcoordT2);
    Screen('Flip',w);
    
    % click in the response screen?
    if buttons(1) && yclick < par.heightConfirmScreen
        
        % click on left side of the screen? x coordinate and fraction of
        % the line is saved for T1
        if xclick < par.width/2
            xcoordT1 = xclick;
            fracT1 = (xclick-par.width/20) / (par.width/20*8);
            estimPosT1 = par.sequenceLength * fracT1;
            % click on the right side of the screen? x coordinate and fraction of
            % the line is saved for T2
        elseif xclick > par.width/2
            xcoordT2 = xclick;
            fracT2 = (xclick-11*par.width/20) / (par.width/20*8);
            estimPosT2 = par.sequenceLength * fracT2;
        end
    end
    
    % Click below response screen (buttons), not seen sets dummy x
    % coordinate and fraction to 8881 for T1 and 9991 for T2 (easy to pick
    % out in analysis)
    
    if buttons(1) && yclick > par.heightConfirmScreen
        
        % whichButtonClicked returns the name of the button that is
        % clicked. If nothin is reported on T2, estimations are set to arbitrary
        % values
        whichButton = whichButtonClicked(buttons(1),xclick,yclick);
        if strcmp(whichButton,'t2NotSeen')
            xcoordT2 = 9992;
            estimPosT2 = 9992;
        end
    end
    
    % sufficient input is given, we wait untill return is pressed to
    % confirm and complete the estimation
    if isnumeric(xcoordT1) && isnumeric(xcoordT2)
        [ keyIsDown, timeSecs, keyCode ] = KbCheck;
        if keyIsDown
            if sum(keyCode(par.nextKey)) > 0
                estimCompl = true;
            end
        end
        
    end
end

% if T1 or T2 are reported, we ask for the letter, otherwise we move on.
% Keep asking untill resp contains letters. Responding with multiple
% letters is possible, backspace doesn;t work (on mac)
if xcoordT1 ~= 8881
    while sum(isstrprop(respT1,'alpha')) ~= 1
        drawInputScreen(xcoordT1,xcoordT2);
        respT1 = GetEchoString(w,'Enter first letter:',0.25*par.width-100, par.heightEstimLines+20,par.white);
        Screen('Flip',w);
        respT1 = upper(respT1);
    end
else respT1 = 'NONE';
end
if xcoordT2 ~= 9992
    while sum(isstrprop(respT2,'alpha')) ~= 1
        drawInputScreen(xcoordT1,xcoordT2);
        respT2 = GetEchoString(w,'Enter second letter:',0.75*par.width-100, par.heightEstimLines+20,par.white);
        Screen('Flip',w);
        respT2 = upper(respT2);
    end
else respT2 = 'NONE';
end


% all responses were given, move on to next trial on keypress
DrawFormattedText(w, 'Please press return to continue' , 'center', 'center', par.white);
Screen('Flip',w);

waitForKeypress(par.nextKey);

end