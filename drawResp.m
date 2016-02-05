function drawResp(x)

% function to draw a dot

global par;
global w;

drawInputScreen();

if x == 9999
    setFont(par.instructions.body)
    DrawFormattedText(w, 'NOT SEEN' , 0.25*par.width, par.heightEstimLines+20, par.orange);
elseif x == 9991
    setFont(par.instructions.body)
DrawFormattedText(w, 'NOT SEEN' , 0.75*par.width, par.heightEstimLines+20, par.orange);
else
    Screen('DrawDots',w,[x,par.heightEstimLines],20,par.orange,[],[1]);
end
end