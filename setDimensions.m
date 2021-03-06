function setDimensions(width,height)

% Function to calculate the graphics used in the experiment (lines,
% buttons, etc.)

global par;
global w;

%set dimensions for the input screen
% define lines from a to b
par.heightEstimLines = height/2;
par.heightInstructions = height/6;
par.line1Xa = width/20;
par.line2Xa = 11*width/20;
par.line1Xb = 9*width/20;
par.line2Xb = 19*width/20;
par.lineXa = width/20;
par.lineXb = 19*width/20;

% Confine space where input can be provided
par.sizeConfirmScreen = 0.25;
par.heightConfirmScreen = (1-par.sizeConfirmScreen)*height;
par.heightConfirmButton = (1-0.5*par.sizeConfirmScreen)*height;

% Calculate where text in input screen should come
% lines = textscan(par.t1Text,'%s','delimiter','-');
% t1line1 = char(lines(1));
% t1line2 = char(lines(2));
% rectt1line1 = Screen('TextBounds',w,t1line1);
% rectt1line2 = Screen('TextBounds',w,t1line2);
% par.t1line1x = rectt1line1(3)
% par.t1line1y = rectt1line1(4)
% par.t1line2x = rectt1line2(3)
% par.t1line2x = rectt1line2(4)

% lines = textscan(par.t2Text,'%s','delimiter','-');
% par.t2TextCoords = {};
% for i = 1:length(lines)
%     rect = Screen('TextBounds',w,char(lines(i)));
%     t2TextTempX = rect(3);
%     t2TextTempY = rect(4);
%     par.t2TextCoords = {par.t2TextCoords ;char(lines(i)) t2TextTempX t2TextTempY};
% end
% t1TextCoords
% t2TextCoords



% Lines to draw in the input screen
par.lines = [par.line1Xa par.line1Xb par.line2Xa par.line2Xb ; par.heightEstimLines par.heightEstimLines par.heightEstimLines par.heightEstimLines];
par.singleLine = [par.lineXa par.lineXb ; par.heightEstimLines par.heightEstimLines];

end