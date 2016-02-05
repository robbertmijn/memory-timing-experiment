function [estimPosT1 respT1 estimPosT2 respT2] = askResponse()

% Function that asks for response. 1. T1 forced one letter, 2. T2 not
% forced, 3. T1 timeline, (4. T2 timeline)

% function for asking a response

global par;
global w;

% % set input variables
respT1 = '';
respT2 = '';
estimPosT1 = '';
estimPosT2 = '';

setFont(par.normal);
% Ask for T1
while sum(isstrprop(respT1,'alpha')) ~= 1
    DrawFormattedText(w, ['Type the first letter you saw and press return/enter'],'center', 'center', par.white);
    respT1 = GetEchoString(w,'->',par.width/2 - 30,par.height/2+40,par.white);
    Screen('Flip',w);
    respT1 = upper(respT1);
end

% Ask for T2
DrawFormattedText(w, ['Type the second letter you saw and press return/enter'],'center', 'center', par.white);
respT2 = GetEchoString(w,'->',par.width/2 - 30,par.height/2+40,par.white);
Screen('Flip',w);
respT2 = upper(respT2);

% Ask again if T2 is not awnsered
if sum(isstrprop(respT2,'alpha')) < 1
    DrawFormattedText(w, ['Are you sure you there was no second letter?'],'center', 'center', par.orange);
    respT2 = GetEchoString(w,'->',par.width/2 - 30,par.height/2+40,par.white);
    Screen('Flip',w);
    respT2 = upper(respT2);
end

% Ask when T1 was seen using function
estimPosT1 = askPos(['When did you see the first letter, ' respT1 '?']);

% Ask when T2 was seen using function
if sum(isstrprop(respT2,'alpha')) > 0
    estimPosT2 = askPos(['When did you see the second letter, ' respT2 '?']);
end

% all responses were given, move on to next trial on keypress
setFont(par.normal);
DrawFormattedText(w, 'Press the return/enter button to continue' , 'center', 'center', par.white);
Screen('Flip',w);
waitForKeypress(par.nextKey);

end