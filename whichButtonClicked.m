function [button] = whichButtonClicked(click,x,y)
% function to determine if the confirm button was clicked
global par;

button = false;

if click
    % Get the names of all buttons, specified when the button is drawn
    buttons = fieldnames(par.button);
    
    % Loop through the buttons, checking every one if it's clicked
    for i = 1:length(buttons)
        rect = par.button.(buttons{i});
        if x > rect(1) && y > rect(2) && x < rect(3) && y < rect(4)
            button = buttons{i};
        end
    end
end
end
