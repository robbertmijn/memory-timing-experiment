function setFont(fontInfo)
% Sets the font information based on the slots fontsize, font and fontstyle in the structure fontInfo.
%
% Input: a structure with slots fontsize, font (the font name) and
% fontsyle.
% Output: nothing
%
% HvR, 100310, Initial Version
%
global w;
global par;

% set default font unless font given
if nargin == 0
	fontInfo = par.fontsize;
end

Screen('TextSize', w, fontInfo.fontsize);
Screen('TextFont',w, fontInfo.font);
Screen('TextStyle', w, fontInfo.fontstyle);