function doBreak(block_no)

global par;
global w;

datafilename = strcat(par.dataDir, 'memoryTimingBlock-', ...
    num2str(par.subj), '-', ...
    num2str(block_no), '.dat');

blockDat = readtable(datafilename);

t1Corr = 0;
for i = 1:height(blockDat)
    if strcmp(upper(blockDat.t1(i)),upper(blockDat.t1_response(i)))
        t1Corr = t1Corr +1;
    end
end

t2Corr = 0;
for i = 1:height(blockDat)
    if strcmp(upper(blockDat.t2(i)),upper(blockDat.t2_response(i)))
        t2Corr = t2Corr + 1;
    end
end

text = ['You can now take a break!\n\n'...
    'On the last ', num2str(height(blockDat)), ' trials, you had the first letter correct ' num2str(t1Corr) ' times,\n\n'...
    'The second letter you had correct on ' num2str(t2Corr) ' trials. Keep it up!\n\n'...
    'Press enter/return to continue to the next block'];

DrawFormattedText(w,text,'center', 'center', par.white);
Screen('Flip', w);

waitForKeypress(par.nextKey);

end