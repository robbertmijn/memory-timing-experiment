function setParameters()

% Par contains all sorts of parameter settings for the experiments,
% ranging from font-sizes to SOAs.
global par;
% The Psychtoolbox screen variable:
global w;

par.debug = false;

par.expName        = 'memoryTiming';
par.dataDirPrefix  = 'Data/memoryTiming-';
par.subj           = input('Please enter subject number (>0), 9999 for a test run:');
par.curTrial       = 0;
par.curTrialGlobal = 0;
par.stimDuration   = .1;
par.fixDuration    = 1;
par.excluded       = '[GILMNOQSWXYZ]';
par.condList       = [];
par.sequenceLength = 21;

% Set conditions {lag t1pos;lag t1pas; etc..}
% par.conditions     = {0 4;1 4;2 4;3 4;4 4;5 4;6 4;7 4;0 5;1 5;2 5;3 5;4 5;5 5;6 5;7 5;0 6;1 6;2 6;3 6;4 6;5 6;6 6;7 6;0 0};
% par.conditions     = {0 4;1 4;3 4;8 4;0 5;1 5;3 5;8 5;0 6;1 6;3 6;8 6;0 0};
% t1 at 4, 5, 6, 7, 8 with lag 1, 3, 5, 7, 9 (25 dual, 5 single, 1 no)
par.conditions     = {0 4;1 4;3 4;5 4;7 4;9 4;0 5;1 5;3 5;5 5;7 5;9 5;0 6;1 6;3 6;5 6;7 6;9 6;0 7;1 7;3 7;5 7;7 7;9 7;0 8;1 8;3 8;5 8;7 8;9 8;0 0};


%% Some parameters for the experiment.
% ### mac boolean
par.onamac = strcmp(computer('arch'), 'maci');

par.font      = 'Tahoma';
par.fontstyle = 1;                             % 0 is normal, 1 bold, 2 italics.
par.fontsize  = 32;

%% Instruction screen settings:
par.instructions.header.font      = 'Tahoma';
par.instructions.header.fontstyle = 1;         % 0 is normal, 1 bold, 2 italics.
par.instructions.header.fontsize  = 25;
par.instructions.header.color     = [255 255 255];

par.normal.font      = 'Tahoma';
par.normal.fontstyle = 1;         % 0 is normal, 1 bold, 2 italics.
par.normal.fontsize  = 25;
par.normal.color     = [255 255 255];

par.instructions.body.font        = 'Tahoma';
par.instructions.body.fontstyle   = 0;         % 0 is normal, 1 bold, 2 italics.
par.instructions.body.fontsize    = 21;
par.instructions.body.color       = [255 255 255];

par.stylebutton.font              = 'Arial';
par.stylebutton.fontstyle         = 1;         % 0 is normal, 1 bold, 2 italics.
par.stylebutton.fontsize          = 16;
par.stylebutton.color             = [255, 165, 0];

par.stimulus.font                 = 'Courier';
par.stimulus.fontstyle            = 0;         % 0 is normal, 1 bold, 2 italics.
par.stimulus.fontsize             = 100;
par.stimulus.color                = [255 255 255];

% Make sure keyboard mapping is the same on all supported operating systems
KbName('UnifyKeyNames');

% Init keyboard responses (caps doesn't matter)
par.nextKey = KbName('return');
par.quitKeys     = [KbName('t') KbName('q')];

% Init colors used in this experiment
par.blue      = [0, 0, 150];
par.green     = [0, 150, 0];
par.red       = [200, 0, 0];
par.black     = [0, 0, 0];
par.lightgrey = [200, 200, 200];
par.darkgrey  = [75, 75, 75];
par.grey      = [128, 128, 128];
par.white     = [255, 255, 255];
par.yellow    = [255, 255, 0];
par.orange    = [255, 165, 0];
par.lime      = [0, 255, 0];

%% Check for name of directory, only throw error if ~=9999 / debug

par.dataDir = strcat(par.dataDirPrefix,num2str(par.subj),'/');

if (par.subj ~= 9999) & exist(par.dataDir,'dir')
  error(sprintf(['Result data directory %s already exists! Choose a ' ...
                 'different subject number.'], par.dataDir));
end

% ### create dir
if ~exist(par.dataDir, 'dir')
  mkdir(par.dataDir);
end
