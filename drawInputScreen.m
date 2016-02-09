function drawInputScreen(xcoordT1,xcoordT2)

% function that makes the graphics of the input screen, including given
% responses. Dimensions are set in "setDimensions.m"

global par;
global w;

% instruction text set in setuppar and setdimensions
setFont(par.normal);
leftString = ['Indicate on the this line\nwhen you saw the first letter.'] ;
DrawFormattedText(w, leftString,par.width/4-200, 150, par.white);
rightString = ['Indicate on the this line\nwhen you saw the second letter.'] ;
DrawFormattedText(w, rightString,3*par.width/4-200, 150, par.white);

% estimation lines and screen divider
Screen('DrawLines',w,par.lines,3,par.white);
Screen('DrawDots',w,par.lines,10,par.white,[],[1]);

% drawConfirmButton(width,height,x,y)
% Returns the rectangle used to determine if it's clicked
% par.button.confirm    = drawButton('confirm',300,100,0.5*par.width,par.heightConfirmButton);
% par.button.t1NotSeen  = drawButton('Nothing to report',0.25*par.width-123,par.heightConfirmButton);
par.button.t2NotSeen  = drawButton('Nothing to report',0.75*par.width,par.heightConfirmButton);

setFont(par.normal);
DrawFormattedText(w, 'Return/Enter to confirm','center', par.heightConfirmButton, par.white);


% draw responses
if isnumeric(xcoordT1)
    if xcoordT1 ~= 8881
        Screen('DrawDots',w,[xcoordT1,par.heightEstimLines],20,par.orange,[],[1]);
    else
    setFont(par.normal);
    DrawFormattedText(w, 'NOT REPORTED' , 0.25*par.width, par.heightEstimLines+20, par.orange);
    end
end

if isnumeric(xcoordT2)
    if xcoordT2 ~= 9992
        Screen('DrawDots',w,[xcoordT2,par.heightEstimLines],20,par.orange,[],[1]);
    else
        setFont(par.normal);
        DrawFormattedText(w, 'NOT REPORTED' , 0.75*par.width, par.heightEstimLines+20, par.orange);
    end
end


end