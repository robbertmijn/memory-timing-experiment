function [rect] = drawButton(text,x,y)

% function to draw the confirm button
global par;
global w;

setFont(par.stylebutton);
[nx,ny,rect] = DrawFormattedText(w, text , x, y, par.white);
rect = rect + [-20 -20 20 20];
Screen('Framerect',w,par.white,rect);

end
