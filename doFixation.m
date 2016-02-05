function doFixation()

global par;
global w;

fixCrossSize = 40;

xCoords = [(par.width/2)-fixCrossSize (par.width/2)+fixCrossSize (par.width/2) (par.width/2)];
yCoords = [(par.height/2) (par.height/2) (par.height/2)+fixCrossSize (par.height/2)-fixCrossSize];
allCoords = [xCoords; yCoords];

lineWidth = 4;

Screen('DrawLines', w, allCoords, lineWidth, par.white);
Screen('Flip',w);
WaitSecs(par.fixDuration);

end
