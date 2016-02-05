function [estimPos] = askPos(textString)
% Function to ask when a stimulus was seen on a timeline

global par;
global w;

% Set variables, end function when estimCompl becomes true in the loop
estimCompl = false;
xcoord = false;

ShowCursor;

while ~estimCompl
    
    % During the loop, mouse keeps on getting polled
    [xclick,yclick,buttons] = GetMouse(w);
    setFont(par.normal);
    DrawFormattedText(w, textString, 'center', 50, par.white);
    Screen('DrawLines',w,par.singleLine,3,par.white);
    
    % Draw a button that can be detected by the whichButtonClicked function
    par.button.confirm  = drawButton('confirm',0.5*par.width,par.heightConfirmButton);
    
    % Get x coordinate of the guess and draw a orange dot.
    if buttons(1) && yclick < par.heightConfirmScreen
        xcoord = xclick;
    end
    
    if isnumeric(xcoord)
        Screen('DrawDots',w,[xcoord,par.heightEstimLines],20,par.orange,[],[1]);
    end
    
    % Poll which button is being clicked, if the etimate is given and
    % confirm is clicked, we move on.
    whichButton = whichButtonClicked(buttons(1),xclick,yclick);
    if strcmp(whichButton,'confirm') && isnumeric(xcoord)
        estimCompl = true;
    end
    Screen('Flip',w);
end 
    % calc the fraction of the timeline. 
    frac = (xcoord-par.width/20)/(par.width/20*18);
    estimPos = par.sequenceLength*frac;
end
