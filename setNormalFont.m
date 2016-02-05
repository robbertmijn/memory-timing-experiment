function setNormalFont()

global par;
global w;

Screen('TextSize', w, par.fontsize);
Screen('TextFont',w, par.font);
Screen('TextStyle', w, par.fontstyle);

    